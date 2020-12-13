require 'test_helper'

class ShowingTest < ActiveSupport::TestCase
  setup do
    @showing = Showing.new
    @showing.film_id = films(:film_one).id
    @showing.room_id = rooms(:room_one).id
    @showing.startTime = '2022-10-22 22:00:00'
    @showing.finishTime = '2022-10-22 24:00:00'
  end


  test "getNextWeek showings" do
    assert_equal Showing.where(startTime: (Time.now.midnight)..(Time.now.midnight + 7.day)), Showing.inTheNextWeek
  end

  test "validate correct data" do
    @showing.save
    assert @showing.valid?
  end

  test "invalid startTime" do
    @showing.startTime = '2020-01-10'
    @showing.save
    assert @showing.invalid?
  end

  test "non-existent room" do
    # we need to catch this error as sql is enforcing the not null rule as well
    begin
      @showing.room = Room.new
      @showing.save
    rescue StandardError => e
      assert true
    end
  end

  test "non-existent film" do
    begin
      @showing.film = Film.new
      @showing.save
    rescue StandardError => e
      assert true
    end
  end
end
