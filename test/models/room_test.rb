require 'test_helper'

class RoomTest < ActiveSupport::TestCase
 

  test "valid room" do
    @room = Room.new
    @room['format'] = 'A'
    @room.numberOfSeats = 34
    @room.WheelChair_Access = true
    @room.save
    assert @room.valid?
  end

  test "invalid format" do
    @room = Room.new
    @room['format'] = 'P'
    @room.numberOfSeats = 34
    @room.WheelChair_Access = true
    @room.save
    assert @room.invalid?
  end
  
end
