class Admin::ImpersonationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def new
    impersonate_user(@user)
    redirect_to account_index_path
  end

  private

  def set_user
    @user = User.find_by_id(params[:user_id])
  end
end
