class Booking < ApplicationRecord
  # ID, Showing, Customer, SeatNumber

  # Validations
  validates_associated :showing, presence: true
  validates_associated :user, presence: true
  validates_associated :seats, inverse_of: :booking, presence: true

  
  has_many :seat
  belongs_to :showing # A showing must exist for this booking to exist
  belongs_to :user    # Similar with a customer, a booking can no be made without a customer
end