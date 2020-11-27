class Film < ApplicationRecord
    # ID, Title, Synopsis, Rating, Language, Release_date
    







    
    # Use of active_storage gem
    has_one_attached :poster

    has_many :showings
end
