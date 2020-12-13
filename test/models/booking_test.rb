require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  

  test "test that seats are destroyed" do
    @booking = bookings(:booking_one)
    # save the id for this booking to check later
    booking_id = @booking.id
    # delete the booking
    @booking.destroy

    # there should be no seats for this booking, as it has been cancelled
    seats = Seat.where(booking: booking_id)

    # if none are returned all seats have been deleted
    unless seats.count == 0
      assert false
    else
      assert true
    end
  end

end
