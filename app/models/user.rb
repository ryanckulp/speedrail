class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  scope :subscribed, -> { where(paying_customer: true) }

  after_create do
    delay.send_welcome_email
    delay.setup_stripe_customer
  end

  def finished_onboarding?
    paying_customer? # insert logic, used by 'offer_setup_assistance' cron mailer
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

  def setup_stripe_customer
    customer = Stripe::Customer.create({
      email: self.email,
      metadata: {
        external_id: self.id
      }
    })

    update(stripe_customer_id: customer.id)
  end
end
