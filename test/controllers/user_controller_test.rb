require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
 
  setup do
    @user = users(:test_admin)
  end

  # Signed in
  test "should get user bookings" do
    # User must be signed in
    sign_in @user
    # try getting their profile
    get '/users/show'
    # the page has loaded as intended
    assert_response :success
    # get the bookigns for this user
    assert @bookings != Booking.where(user: @user).order('created_at DESC')
    
  end

  # Signed out
  test "shout not get user bookings" do
    get '/users/show'
    assert_response :redirect
  end

  # Test accessing profile
  test "should get user profile" do
    get '/users/edit'
    assert_response :redirect

    sign_in @user

    get '/users/edit'
    assert_response :success
  end


  # Test updating profile
  test "should update user profile" do
    sign_in @user
 



   
  end

  # Test delete account
  test "should delete user" do
    sign_in @user
 



   
  end


end
