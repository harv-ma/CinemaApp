class Film < ApplicationRecord
    # ID, Title, Synopsis, Rating
    # to be added: PosterURL, Language, Release Date
    has_one_attached :poster


    has_many :showings
end
