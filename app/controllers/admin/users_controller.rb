class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to edit_admin_user_path(id: @user.id), notice: 'User updated successfully.'
  end

  def destroy
    email = @user.email
    DestroyUser.new(@user).call
    redirect_to admin_dashboard_index_path, notice: "User '#{email}' was destroyed."
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :admin)
  end
end
