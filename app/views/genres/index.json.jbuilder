json.array! @genres do |genre|
  json.genre genre
  json.movies "#{request.base_url}#{movies_path(genre: genre)}"
end
