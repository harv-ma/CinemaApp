class Booking < ApplicationRecord
  # ID, Showing, Customer, SeatNumber

  # Validations
  validates :showing, presence: true
  validates :user, presence: true

  
  
  belongs_to :showing
  belongs_to :user
end