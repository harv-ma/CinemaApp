class Showing < ApplicationRecord
  # ID, startTime, finishTime, FK room, FK film  

  # Validations
  validates :startTime, presence: true
  validates :room, presence: true
  validates :film, presence: true
  validate :validate_time # our custom validator
  
  # might delete these
  def self.getCurrentShowings
    return currentShowings = Showings.all
  end

  def self.getNextWeekFilms
    return Showing.where('startTime > ?', Date.today)
  end

  # Associations
  belongs_to :film
  belongs_to :room

  # This takes the current showing object and checks if it
  # overlaps with any showing scheduled in the same room
  def validate_time
    s = Showing.where(room: room)
    showings = s.where('(startTime BETWEEN ? AND ?) OR (finishTime BETWEEN ? AND ?)', startTime, finishTime, startTime, finishTime)
    unless showings.count == 0
      errors.add(:base, "This conflicts with another showing!")
    end
  end
 
end
