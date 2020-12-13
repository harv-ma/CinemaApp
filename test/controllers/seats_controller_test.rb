require 'test_helper'
require 'json'

class SeatsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
 
  setup do
    @film = films(:film_one)
    @admin = users(:test_admin)
    @user = users(:test_user)
    @showing = showings(:showing_one)
  end

  # Should return a list of seats
  test "get seats for a showing" do
    sign_in @user
    
    post "/showings/#{@showing.id}", xhr: true
  
    response = JSON.parse(@response.body)

    # Get seat layout from config
    file = File.read('app/assets/config/seat_layouts.json')
    layout = JSON.parse(file)

    # Unavailable seats
    seat1 = seats(:seat_one)
    seat2 = seats(:seat_two)
    seats = ["#{seat1.row}_#{seat1.col}", "#{seat2.row}_#{seat2.col}"]
     
    # Check the layout is returned correctly
    assert_equal layout['A'], response['layout']
    # Check the list of unavailable seats is returned correctly
    assert_equal seats, response['seats']
    assert_equal "application/json", @response.media_type

  end

end
