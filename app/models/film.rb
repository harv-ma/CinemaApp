class Film < ApplicationRecord
    # ID, Title, Synopsis, Rating, Language, Release_date, duration



    
    # Use of active_storage gem
    has_one_attached :poster

    has_many :showings
end
