class Room < ApplicationRecord
    # ID, NoOfSeats, WheelChair_Access

    has_many :showings
end
