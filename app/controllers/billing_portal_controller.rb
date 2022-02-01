class BillingPortalController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create] # ajax

  def create
    if customer_is_onboarding?
      redirect_url = begin_subscription
    else
      redirect_url = modify_subscription
    end

    respond_to do |format|
      format.html { redirect_to redirect_url }
      format.json { render json: { url: redirect_url } }
    end
  end

  def destroy
    current_user.unsubscribe!
  end

  private

  def customer_is_onboarding?
    request.referer.include?('subscribe') # creating portal session from onboarding wizard
  end

  # invoked from /subscribe during onboarding
  def begin_subscription
    session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      payment_method_types: ['card'],
      mode: 'subscription',
      allow_promotion_codes: true,
      line_items: [{
        quantity: 1,
        price: ENV['stripe_product_price_id']
      }],
      success_url: "#{ENV['base_url']}#{dashboard_index_path}?subscribed=true",
      cancel_url: "#{ENV['base_url']}#{account_index_path}?aborted=true"
    })

    session.url
  end

  # invoked from /account when user is already subscribed
  def modify_subscription
    session = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id,
      return_url: "#{ENV['base_url']}/#{account_index_path}?updated=true"
    })

    session.url
  end
end
