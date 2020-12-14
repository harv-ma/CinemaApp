class Film < ApplicationRecord
    # ID, Title, Synopsis, Rating, Language, Release_date, duration

    # Validations
    validates :title, presence: true, uniqueness: { case_sensitive: false }
    validates :synopsis, presence: true
    validates :rating, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
    validates :duration, presence: true, numericality: {greater_than: 0}
    validates :language, presence: true

    # Use of active_storage gem
    has_one_attached :poster

    has_many :showings, dependent: :destroy
end
