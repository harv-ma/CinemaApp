class BookingsController < ApplicationController
  require 'json'  
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  before_action :validateAdmin, only: [:index]
  before_action :check_user, only: [:show, :destroy] # so you can't alter someone elses booking

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all    
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @showing = @booking.showing
    @film = @showing.film
    @room = @showing.room
    @seats = Seat.where(booking: @booking)
  end

  # POST /showings/:id/book
  def create
    id = params['id']
    seats = params['seats']
    showing = Showing.find(id)
    
    # Create the booking
    @booking = Booking.new(showing: showing, user: current_user)

    # Create seats for the booking
    seats.each do |seat|
      seat = seat[1] # array is [0, [our seat array]] not sure why but \o-o/
      # check before creating the seat
      if Seat.exists?(seatNumber: seat[0], showing: showing)
        raise "Seat already exists"
      end

      s = Seat.new(seatNumber: seat[0], booking: @booking, showing: showing, row: seat[1], col: seat[2])
      # the above line above saves the booking; as an association must be made
      if !s.save
        # if the seats are already taken we cancel the booking
        # dependencies ensure the previous seats are also destroyed with it
        @booking.destroy
        raise "Unable to save seat"
      end
    end

    data = {
      :booking_id => @booking.id
    }

    respond_to do |format|
      if @booking.save
        format.json { render json: data, status: :created, location: @booking }
      else
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

 
  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to '/users/show', notice: 'Booking was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:id, :seats)
    end

    def check_user
      if !current_user.admin
        if @booking.user != current_user
          render_403
        end
      end
    end
end
