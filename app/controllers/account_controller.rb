class AccountController < ApplicationController
  before_action :authenticate_user!

  def index
    flash.now[:notice] = 'Subscription updated successfully' if params[:updated] == 'true'
  end

  def update
    current_user.update(account_update_params)
    sign_in(current_user, bypass: true) # prevents user from needing to log back in
    redirect_to account_index_path, notice: 'Profile updated successfully'
  end

  private

  def account_update_params
    params.require(:user).permit(:email, :password)
  end
end
