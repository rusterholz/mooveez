class Rating < ApplicationRecord
  include ReadOnly

  establish_connection :ratings # this model lives in a separate database

  self.primary_key = 'ratingId'

  belongs_to :movie, inverse_of: :ratings, foreign_key: 'movieId'
end
