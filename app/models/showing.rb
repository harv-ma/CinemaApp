class Showing < ApplicationRecord
  # ID, startTime, finishTime, FK RoomID, FK FilmID  





  belongs_to :film
  belongs_to :room
end
