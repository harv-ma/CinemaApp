class UserController < ApplicationController


    def show
        @bookings = Booking.where(user: current_user)

    end


    
    
    
    
    
    private
        def getUserBookings
        # Will return all bookings for a specific user
        # route: /users/show


    end



end
