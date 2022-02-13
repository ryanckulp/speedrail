class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable

  validates :email, uniqueness: { case_sensitive: false }, presence: true

  scope :subscribed, -> { where(paying_customer: true) }

  after_create do
    delay.send_welcome_email
    delay.setup_stripe_customer
  end

  def finished_onboarding?
    stripe_subscription_id?
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

  # done after signup, for easy acquisition metrics inside Stripe UI
  def setup_stripe_customer
    customer = Stripe::Customer.create({
      email: self.email,
      metadata: {
        external_id: self.id
      }
    })

    update(stripe_customer_id: customer.id)
  end

  # done after user adds payment method, for easy CVR metrics inside Stripe UI
  def set_stripe_subscription
    cust = Stripe::Customer.retrieve({
      id: stripe_customer_id,
      expand: ['subscriptions']
    })
    subscription_id = cust.subscriptions.first.id
    update(stripe_subscription_id: subscription_id)
  end
end
