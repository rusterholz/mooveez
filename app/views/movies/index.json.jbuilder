json.array! @movies do |movie|
  json.imdb_id      movie.imdbId
  json.title        movie.title
  json.genres       movie.genres
  json.release_date movie.releaseDate
  json.budget       number_to_currency(movie.budget)
end
