class Movie < MoviesRecord
  include ReadOnly

  self.primary_key = 'movieId'
end
