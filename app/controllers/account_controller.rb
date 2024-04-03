class AccountController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashes

  def index; end

  def update
    current_user.update(account_update_params)
    sign_in(current_user, bypass: true) # prevents user from needing to log back in
    redirect_to account_index_path, notice: 'Profile updated successfully'
  end

  def stop_impersonating
    stop_impersonating_user
    redirect_to admin_root_path
  end

  private

  def account_update_params
    params.require(:user).permit(:email, :password)
  end

  def set_flashes
    flash.now[:notice] = 'Subscription updated successfully' if params[:updated] == 'true'
  end
end
