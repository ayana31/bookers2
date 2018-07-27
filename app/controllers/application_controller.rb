class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	


	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end

	def after_sign_up_path_for(resource)
		user_url(resource)
	end
	def after_sign_in_path_for(resource)
		user_url(resource)
	end

	def create
		@user = User.new
		if @user.save
		  flash[:success] = 'Successfully.'
		  redirect_to user_path
	    else
	      render :top
	end
	end
end