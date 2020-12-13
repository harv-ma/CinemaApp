class Showing < ApplicationRecord
  # ID, startTime, finishTime, FK room, FK film  

  # Validations
  validates :startTime, presence: true
  validates :room, presence: true
  validates :film, presence: true
  validate :validate_time # our custom validator

  # Scopes
  scope :inTheNextWeek, -> {where(startTime: (Time.now.midnight)..(Time.now.midnight + 7.day))}
  
  # might delete these
  def self.getCurrentShowings
    return currentShowings = Showings.all
  end

  

  # Associations
  belongs_to :film
  belongs_to :room

  # This takes the current showing object and checks if it
  # overlaps with any showing scheduled in the same room
  def validate_time
    s = Showing.where(room: room)
    # Check if this showing overlaps another
    showings = s.where('id <> ? AND startTime <= ? AND finishTime >= ?', id, finishTime, startTime)
    # if none are returned there are no overlaps
    unless showings.count == 0
      errors.add(:base, "This conflicts with another showing!")
    end
  end
 
end
