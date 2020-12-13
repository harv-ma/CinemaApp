require 'test_helper'

class ShowingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @showing = showings(:showing_one)
    @booking = bookings(:booking_one)
    @admin = users(:test_admin)
    @user = users(:test_user)
    @film = films(:film_one)
  end

  test "should get index" do
    get showings_url
    assert_response :success
  end

  test "should get new" do
    get new_showing_url
    assert_response :unauthorized
  end

  test "should create showing" do
    post showings_url, params: { showing: { film_id: @film, room_id: rooms(:room_one), startTime: '2021-10-10 10:10:00' } }
    assert_response :unauthorized

    sign_in @admin
    assert_difference('Showing.count') do
      post showings_url, params: { showing: { startTime: '2021-11-10 10:10:00', film_id: @film.id, room_id: rooms(:room_one).id } }
    end

    assert_redirected_to showing_url(Showing.last)
  end

  test "should show showing" do
    get showing_url(@showing)
    assert_response :success
  end

  test "should get edit" do
    get edit_showing_url(@showing)
    assert_response :unauthorized
    
    sign_in @admin
    get edit_showing_url(@showing)
    assert_response :success
  end

  test "should update showing" do
    patch showing_url(@showing), params: { showing: { film_id: @showing.film_id, room_id: @showing.room_id, startTime: @showing.startTime } }
    assert_response :unauthorized

    sign_in @admin
    patch showing_url(@showing), params: { showing: { film_id: @showing.film_id,  room_id: @showing.room_id, startTime: @showing.startTime } }
    assert_redirected_to showing_url(@showing)
  end

  test "should destroy showing" do
    delete showing_url(@showing)
    assert_response :unauthorized

    sign_in @admin
    assert_difference('Showing.count', -1) do
      delete showing_url(@showing)
    end

    assert_redirected_to showings_url
  end
end
