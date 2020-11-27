class Booking < ApplicationRecord
  # ID, ShowingID, CustomerID, SeatNumber

  # Validations


  
  
  belongs_to :showing
  belongs_to :customer
end
