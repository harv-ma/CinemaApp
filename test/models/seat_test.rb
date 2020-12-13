require 'test_helper'

class SeatTest < ActiveSupport::TestCase
  setup do
    @seat = Seat.new
    @seat.seatNumber = 12
    @seat.booking = bookings(:booking_one)
    @seat.showing = showings(:showing_one)
    @seat.row = 1
    @seat.col = 12
  end

  # Not many tests, as most of the validation is done with booking and showings
  # and sql rules

  test "valid seat" do
    @seat.save
    assert @seat.valid?
  end
  
end
