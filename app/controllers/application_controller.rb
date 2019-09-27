class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if resource.class == Admin
        admins_admins_path
      elsif resource.class == User
      root_path
      end
    end

    def after_sign_out_path_for(resource)
      if resource == :admin
        new_admin_session_path
      elsif resource == :user
        root_path
      end
    end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
	end
end
