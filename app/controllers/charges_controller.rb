class ChargesController < ApplicationController
  include Chargeable

  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  before_action :create_customer, only: [:create]
  before_action :set_card_source, only: [:create]

  before_action :set_customer, only: [:destroy]

  def create
    create_subscription
    current_user.upgrade!

    # TODO: update to a thank-you path
    redirect_to root_path, notice: 'Payment successful.'
  end

  def destroy
    cancel_subscription
    current_user.downgrade!

    redirect_to root_path, notice: 'Your subscription was cancelled successfully.'
  end
end
