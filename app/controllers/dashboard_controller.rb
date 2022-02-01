class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashes

  def index
  end

  private

  def set_flashes
    if params[:subscribed] == 'true'
      flash.now[:notice] = 'Your account is now active!'
    end
  end
end
