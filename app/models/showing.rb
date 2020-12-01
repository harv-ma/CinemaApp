class Showing < ApplicationRecord
  # ID, startTime, FK RoomID, FK FilmID  

  def self.getCurrentShowings
    return currentShowings = Showings.all
  end

  def self.getNextWeekFilms
    return Showing.where('startTime > ?', Date.today)
  end


  belongs_to :film
  belongs_to :room
end
