class AdminController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: :desc)
  end

  def impersonate
    user_to_impersonate = User.find_by(id: params[:user_id])
    sign_in(user_to_impersonate)
    redirect_to dashboard_index_path, notice: "[ADMIN] You are now signed in as #{user_to_impersonate.email}"
  end
end
