class BookingsController < ApplicationController


    def create
        @booking = Booking.new(booking_params)

        if @booking.valid?
            respond_to do |format|
                if @booking.save
                    format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
                    format.json { render :show, status: :created, location: @booking }
                else
                    format.html { render :new }
                    format.json { render json: @booking.errors, status: :unprocessable_entity }
                end
            end
        else 
            format.html { render :new }
            format.json { render json: @booking.errors.messages, status: :unprocessable_entity }
        end
    end


    private
        # Use callbacks to share common setup or constraints between actions.
        def set_booking
            @booking = Booking.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def booking_params
            params.require(:booking).permit(:showing, :customer, :seatNumber)
        end

end
