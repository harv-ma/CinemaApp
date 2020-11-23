class Showing < ApplicationRecord
  belongs_to :film
  belongs_to :room

  has_many :booking
end
