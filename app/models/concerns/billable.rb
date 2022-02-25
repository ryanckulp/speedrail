module Billable
  extend ActiveSupport::Concern

  included do
    after_create :setup_stripe_customer
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
  # handle_asynchronously :setup_stripe_customer

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
