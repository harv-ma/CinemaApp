require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @booking = bookings(:booking_one)
    @showing = showings(:showing_one)
    @admin = users(:test_admin)
    @user = users(:test_user)
  end


  test "should get index" do
    get bookings_url
    assert_response :redirect
    sign_in @admin
    get bookings_url
    assert_response :success
  end


  test "should create booking" do
    # test making a booking when we are not logged in
    post "/showings/#{@showing.id}/book", xhr: true, params: { seats: {"0" => [[58, 4, 15], [57, 4, 14]]}}
    assert_response :unauthorized
    
    
    # must be signed in to make a booking
    sign_in @user
    
    post "/showings/#{@showing.id}/book", xhr: true, params: { seats: {"0" => [[58, 4, 15], [57, 4, 14]]}}
  
    response = JSON.parse(@response.body)

    # assert the json object
    # there is not way of asserting the booking_id, this is generated dynamically so no way of statically referring to it here
    assert_response :created
    assert_equal "application/json", @response.media_type
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :redirect

    # this user does not own this booking
    sign_in users(:test_user2)
    get booking_url(@booking)
    assert_response :unauthorized

    # user owns this booking
    sign_in @user
    get booking_url(@booking)
    assert_response :success

    # admin
    sign_in @admin
    get booking_url(@booking)
    assert_response :success
  end

  test "should destroy booking" do
    # a guest trying to delete the booking should be redirected to the login screen (equivalent to unauthorized)
    delete booking_url(@booking)
    assert_response :redirect

    # This is the users booking so they can delete it
    sign_in @user
    assert_difference('Booking.count', -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to '/users/show'

    # An admin should be able to delete anyones bookings
    sign_in @admin
    assert_difference('Booking.count', -1) do
      delete booking_url(bookings(:booking_two))
    end

    assert_redirected_to '/users/show'
  end
end
