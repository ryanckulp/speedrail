class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashes

  def index
  end

  private

  def set_flashes
    if params[:subscribed] == 'true'
      current_user.delay.set_stripe_subscription
      flash.now[:notice] = 'Your account is now active!'
    end
  end
end
