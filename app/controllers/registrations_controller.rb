class RegistrationsController < Devise::RegistrationsController
  # custom Devise override code here

  private
  
  def sign_up_params
    params.require(:user).permit(:email, :name, :password)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :current_password, :password)
  end
end
