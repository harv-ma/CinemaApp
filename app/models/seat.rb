class Seat < ApplicationRecord

    # Validations
    validates :seatNumber, presence: true
    validates :booking, presence: true
    validates :showing, presence: true
    validates :row, presence: true
    validates :col, presence: true



    belongs_to :booking
    belongs_to :showing
end
