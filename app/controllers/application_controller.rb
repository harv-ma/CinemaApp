class ApplicationController < ActionController::Base
     # CSRF protection
    protect_from_forgery with: :exception

    # Default to London time zone
    before_action -> { Time.zone = 'London' }

    # Display correct error
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    # Allow our custom fields
    before_action :configure_permitted_parameters, if: :devise_controller?

    # 404 Page
    def render_404
        respond_to do |format|
        format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
        end
    end

    private
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:forename, :surname, :phonenumber, :email, :password])
            devise_parameter_sanitizer.permit(:account_update, keys: [:forename, :surname, :phonenumber, :email, :password, :current_password])
        end
    
end
