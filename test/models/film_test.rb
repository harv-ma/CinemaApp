require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  setup do
    @film = Film.new
    @film.title = "test film"
    @film.synopsis = "test synopsis"
    @film.rating = 7.6
    @film.duration = 2
    @film.language = "English"
    @film.release_date = '2020-10-10'
  end


  test "valid film" do
    @film.save
    assert @film.valid?
  end

  test "invalid rating" do
    @film.rating = -7
    @film.save
    assert @film.invalid?
  end

  test "invalid duration" do
    @film.duration = -2.3920482390
    @film.save
    assert @film.invalid?
  end
end
