class Booking < ApplicationRecord
  # ID, Showing, Customer, SeatNumber

  # Validations
  validates :showing, presence: true
  validates :user, presence: true
  # validates :seat, inverse: booking

  
  has_many :seat, dependent: :destroy
  belongs_to :showing # A showing must exist for this booking to exist
  belongs_to :user    # Similar with a customer, a booking can no be made without a customer
end