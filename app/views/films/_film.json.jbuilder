json.extract! film, :id, :title, :synopsis, :rating, :created_at, :updated_at
json.url film_url(film, format: :json)
