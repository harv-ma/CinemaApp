class Booking < ApplicationRecord
  # ID, Showing, Customer, SeatNumber

  # Validations


  
  
  belongs_to :showing
  belongs_to :customer
end