class Room < ApplicationRecord
    # ID, NoOfSeats, WheelChair_Access
    serialize :seats, Array


    has_many :showings
end
