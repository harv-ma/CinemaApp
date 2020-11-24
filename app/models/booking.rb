class Booking < ApplicationRecord
  # ID, ShowingID, CustomerID, SeatNumber
  
  belongs_to :showing
  belongs_to :customer
end
