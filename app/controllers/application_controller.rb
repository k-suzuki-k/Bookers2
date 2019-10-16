class ApplicationController < ActionController::Base

	#ログインしていない場合
	before_action :authenticate_user!

	# ログイン後のリダイレクト
	def after_sign_in_path_for(resource)
		 user_path(current_user.id)
	end


	# 名前認証
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end

end
