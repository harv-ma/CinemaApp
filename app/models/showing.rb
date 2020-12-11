class Showing < ApplicationRecord
  # ID, startTime, FK RoomID, FK FilmID  

  # Validations
  validates :startTime, presence: true
  validates :room, presence: true
  validates :film, presence: true
  

  def self.getCurrentShowings
    return currentShowings = Showings.all
  end

  def self.getNextWeekFilms
    return Showing.where('startTime > ?', Date.today)
  end


  belongs_to :film
  belongs_to :room

  # Check if a given interval overlaps this interval    
  def overlaps?(other)
    startTime <= other.finishTime && other.startTime <= finishTime
  end

  # Return a scope for all interval overlapping the given interval, excluding the given interval itself
  scope :overlapping, -> { (interval)
    where("id <> ? AND startTime <= ? AND ? <= finishTime", interval.id, interval.finishTime, interval.startTime)
  }
 
end
