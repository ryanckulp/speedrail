class BillingPortalController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:create] # ajax

  def new
    session = Stripe::Checkout::Session.retrieve(params[:session_id])

    # can add more checks, just inspect the 'session' and 'session.customer_details' object
    if session.status == 'complete'
      current_user.set_stripe_subscription
      redirect_to dashboard_index_path, notice: 'Your account is now active!'
    else
      redirect_to subscribe_index_path, alert: "Please subscribe to continue."
    end
  end

  def create
    if current_user.finished_onboarding?
      redirect_to modify_subscription, allow_other_host: true # /account view
    else
      respond_to do |format|
        format.html { redirect_to subscribe_index_path } # /account view
        format.json { render json: create_subscription } # /subscribe view
      end
    end
  end

  private

  # invoked from /subscribe during onboarding
  def create_subscription
    session = Stripe::Checkout::Session.create({
      ui_mode: 'embedded',
      customer: current_user.stripe_customer_id,
      allow_promotion_codes: true,
      payment_method_types: ['card'],
      line_items: [{
        # Provide the Price ID (e.g. price_1234) of the product you want to sell
        price: ENV['STRIPE_PRODUCT_PRICE_ID'],
        quantity: 1
      }],
      mode: 'subscription', # use 'payment' for products with 1-time pricing
      return_url: "#{ENV['BASE_URL']}#{new_billing_portal_path}?session_id={CHECKOUT_SESSION_ID}",
      automatic_tax: { enabled: false }
    })

    { clientSecret: session.client_secret }
  end

  # invoked from /account when user is already subscribed
  def modify_subscription
    session = Stripe::BillingPortal::Session.create({
      customer: current_user.stripe_customer_id,
      return_url: "#{ENV['BASE_URL']}#{account_index_path}?updated=true"
    })

    session.url
  end
end
