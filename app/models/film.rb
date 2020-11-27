class Film < ApplicationRecord
    # ID, Title, Synopsis, Rating, Language, Release_date
    
    has_one_attached :poster


    has_many :showings
end
