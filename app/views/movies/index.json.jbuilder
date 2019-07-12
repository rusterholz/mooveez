json.array! @movies do |movie|
  json.imdb_id      movie.imdbId
  json.title        movie.title
  json.genres       decode_json(movie.genres), 'id', 'name'
  json.release_date movie.releaseDate
  json.budget       number_to_currency(movie.budget)
end
