class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def not_found
        render file: "#{Rails.root}/public/404.html", status: :not_found
    end
    
    before_action :configure_permited_paramters, if: :devise_controller?

   
    protected

    def configure_permited_paramters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end
