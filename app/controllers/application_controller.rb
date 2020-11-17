class ApplicationController < ActionController::Base
     # CSRF protection
    protect_from_forgery with: :exception

    # Default to London time zone
    before_action -> { Time.zone = 'London' }

    # Display correct error
    rescue_from ActiveRecord::RecordNotFound, with: :render_404


    # 404 Page
    def render_404
        respond_to do |format|
        format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
        end
    end
    
end
