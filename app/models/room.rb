class Room < ApplicationRecord
    # Validations
        # Inclusion could be dynamic; can be taken from list of layouts in seat-layouts.json
    validates :format, presence: true, inclusion: { in: %w(A B C), message: "Must be in the list of room layouts!"}
    

    has_many :showings
end
