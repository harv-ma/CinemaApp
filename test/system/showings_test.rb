require "application_system_test_case"

class ShowingsTest < ApplicationSystemTestCase
  setup do
    @showing = showings(:one)
  end

  test "visiting the index" do
    visit showings_url
    assert_selector "h1", text: "Showings"
  end

  test "creating a Showing" do
    visit showings_url
    click_on "New Showing"

    fill_in "Film", with: @showing.film_id
    fill_in "Finishtime", with: @showing.finishTime
    fill_in "Room", with: @showing.room_id
    fill_in "Starttime", with: @showing.startTime
    click_on "Create Showing"

    assert_text "Showing was successfully created"
    click_on "Back"
  end

  test "updating a Showing" do
    visit showings_url
    click_on "Edit", match: :first

    fill_in "Film", with: @showing.film_id
    fill_in "Finishtime", with: @showing.finishTime
    fill_in "Room", with: @showing.room_id
    fill_in "Starttime", with: @showing.startTime
    click_on "Update Showing"

    assert_text "Showing was successfully updated"
    click_on "Back"
  end

  test "destroying a Showing" do
    visit showings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Showing was successfully destroyed"
  end
end
