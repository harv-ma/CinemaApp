require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @film = films(:film_one)
    @admin = users(:test_admin)
    @user = users(:test_user)
  end

  # /films
  test "should get index" do
    get films_url
    assert_response :success
  end

  # /films/admin
  test "should get indexAdmin" do
    # test as a guest
    get films_url + '/admin'
    assert_response :unauthorized
    # test as a user
    sign_in @user
    get films_url + '/admin'
    assert_response :unauthorized
    sign_out @user
    # test as aad Admin
    sign_in @admin
    get films_url + '/admin'
    assert_response :success
  end

  # /films/new
  test "should get new" do
    get new_film_url
    assert_response :unauthorized
    sign_in @admin
    get new_film_url
    assert_response :success
  end

  # create film
  test "should create film" do
    sign_in @admin
    # test valid film creation
    assert_difference('Film.count') do
      post films_url, params: { film: { title: "title", synopsis: "synopsis", rating: 3 , duration: 2, language: "english", release_date: "2022-05-21" } }
    end
    assert_redirected_to film_url(Film.last)

    # test invalid film creation
    
    post films_url, params: { film: { title: "title", synopsis: "synopsis", rating: 100 , duration: -5, language: "english", release_date: "2020-05-21" } }
 
    assert :failure
  end

  # /films/:id
  test "should show film" do
    get film_url(@film)
    assert_response :success
  end

  # /films/:id/edit
  test "should get edit" do
    get edit_film_url(@film)
    assert_response :unauthorized
    sign_in @admin
    get edit_film_url(@film)
    assert_response :success
  end

  # update film
  test "should update film" do
    sign_in @admin
    patch film_url(@film), params: { film: { title: "title", synopsis: "synopsis", rating: 3 , duration: 2, language: "english", release_date: "2022-05-21" } }
    assert_redirected_to film_url(@film)
  end

  # delete film
  test "should destroy film" do
    sign_in @admin
    assert_difference('Film.count', -1) do
      delete film_url(@film)
    end

    assert_redirected_to films_url
  end
end
