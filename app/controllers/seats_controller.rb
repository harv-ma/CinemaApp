class SeatsController < ApplicationController
    require 'json'    



    def getShowingSeats
        # Read in layouts file and parse it into JSON variable
        file = File.read('app/assets/config/seat_layouts.json')
        f = JSON.parse(file)

        @id = params['id'] # ID of showing
        @showing = Showing.where(id: @id).first # actual showing object
        
        # ['1_2', '4_1', '7_1', '7_2'] unavailable format
        unavailableSeats = []
        seats = Seat.where(showing_id: @showing) # get all seats for this showing
        # loop through and setup unavailable format of each seat e.g. (row, col) -> "row_col"
        seats.each do |n|
            unavailableSeats.push("#{n.row}_#{n.col}")
        end

        # Get the seat layout for this showing from the room model
        room = Room.where(id: @showing.room.id).first
        seatLayout = room['format']

       # Setup a json object to send back to Jquery seat charts
        data = {
                :seats => unavailableSeats,
                :layout => f[seatLayout]
                }

        render :json => data # send it back

    end


    private
        def person_params
            params.require(:seat).permit(:id)
        end
end
