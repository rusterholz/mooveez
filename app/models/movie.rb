class Movie < ApplicationRecord
  include ReadOnly

  self.primary_key = 'movieId'
end
