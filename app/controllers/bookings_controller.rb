class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  def success
  end


  # GET /bookings
  # GET /bookings.json
  def index
    if current_user.admin
      @bookings = Booking.all
    else
      @bookings = Booking.where(user: current_user)
    end
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    if @booking.user != current_user
      render_403
    end

    @showing = @booking.showing
    @film = @showing.film
    @room = @showing.room
    @seats = Seat.where(booking: @booking)
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end


  # POST /showings/:id/book
  def create
    # TODO: make sure bookings do not exist and seats are not taken
    
    
    id = params['id']
    seats = params['seats']

    # Create the booking
    @booking = Booking.new(showing: Showing.find(id), user: current_user)

    # Create seats for the booking
    seats.each do |seat|
      seatVal = seat.split('_')
      puts seatVal
      s = Seat.new(booking: @booking, showing: Showing.find(id), row: seatVal[0], col: seatVal[1])
      if !s.save
        raise "error"
      end
    end

    data = {
      :booking_id => @booking.id
    }

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render json: data, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

 
  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
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
end
