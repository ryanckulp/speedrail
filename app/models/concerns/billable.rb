module Billable
  extend ActiveSupport::Concern

  included do
    after_create :setup_stripe_customer
  end

  # done after signup for easy CVR metrics via Stripe UI
  def setup_stripe_customer
    return unless ENV['STRIPE_SECRET_KEY']

    customer = Stripe::Customer.create({
      email: self.email,
      metadata: {
        external_id: self.id
      }
    })

    update(stripe_customer_id: customer.id)
  end

  # done after user adds payment method, for easy CVR metrics inside database
  def set_stripe_subscription
    subscription_id = stripe_subscriptions&.first&.id
    paying_customer = subscription_id ? true : false
    update(stripe_subscription_id: subscription_id, paying_customer: paying_customer)
  end

  def stripe_subscriptions
    stripe_customer.subscriptions
  end

  def stripe_customer
    Stripe::Customer.retrieve({
      id: stripe_customer_id,
      expand: ['subscriptions']
    })
  end
end
