class UserController < ApplicationController

    before_action :authenticate_user!
    
    
    def show
        # Return all bookings for this user
        @bookings = Booking.where(user: current_user).order('created_at DESC')
    end
end
