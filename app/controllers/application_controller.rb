class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    resource.paying_customer? ? dashboard_index_path : subscribe_index_path # point these wherever you want
	end

  def maybe_skip_onboarding
    redirect_to dashboard_index_path, notice: "You're already subscribed" if current_user.finished_onboarding?
  end
end
