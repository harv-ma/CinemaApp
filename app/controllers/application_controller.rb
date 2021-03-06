class ApplicationController < ActionController::Base
    before_action :store_user_location!, if: :storable_location?

    # before_action :authenticate_user!
    
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

    def render_403
        respond_to do |format|
            format.html { render file: "#{Rails.root}/public/403", layout: false, status: :unauthorized }
            format.xml  { head :unauthorized }
            format.any  { head :unauthorized }
        end
    end

    def validateAdmin
        # Is the user logged in?
        if !user_signed_in?
            render_403
        else
            # Does the user have the admin role?
            if !current_user.admin
                render_403
            end
        end

    end


    private
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:forename, :surname, :phonenumber, :email, :password])
            devise_parameter_sanitizer.permit(:account_update, keys: [:forename, :surname, :phonenumber, :email, :password, :current_password])
        end
        def storable_location?
            request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
        end
        
        # Used to remember last page (so we can redirect to it with a back button)
        def store_user_location!
            # :user is the scope we are authenticating
            store_location_for(:user, request.fullpath)
        end
end
