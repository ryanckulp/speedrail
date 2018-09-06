class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :set_user

	def set_user
		@user = current_user if current_user
	end

	# def after_sign_in_path_for(resource)
	# 	(if something true) ? send_user_here : send_user_elsewhere
	# end

end
