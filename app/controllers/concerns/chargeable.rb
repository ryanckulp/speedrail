module Chargeable
  extend ActiveSupport::Concern

  included do
    # TODO: insert your redict path for error handling
    # rescue_from 'Stripe::CardError' do |e|
    #   redirect_to some_path, alert: "Error: #{e.message} Please try again."
    # end
  end

  def create_customer
    @customer = Stripe::Customer.create({
        email: current_user.email,
      })
    current_user.update(stripe_customer_id: @customer.id)
  end

  def set_card_source
    token = params[:stripeToken]
    stripe_credit_card = @customer.sources.create(source: token)
    @customer.default_source = stripe_credit_card.id # always use the most current added card
  end

  def create_subscription
    Stripe::Subscription.create(
      customer: @customer.id,
      items:[ { plan: 'INSERT_STRIPE_PLAN_ID' } ]
    )
  end

  def set_customer
    if current_user.stripe_customer_id
      begin
        @customer = Stripe::Customer.retrieve(current_user.stripe_customer_id)
      rescue InvalidRequestError => e
        @customer = nil if e.message.include?('No such customer')
      end
    end

    @customer = nil if !@customer || @customer.try(:deleted) # customers can be retrieved with limited data even if deleted
  end

  def cancel_subscription
    if @customer.subscriptions
      @customer.subscriptions.each do |sub|
        sub.delete if sub.status != 'canceled'
      end
    end
  end
end
