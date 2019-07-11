class Rating < ApplicationRecord
  include ReadOnly

  # This model lives in a separate database:
  establish_connection :ratings

  self.primary_key = 'ratingId'
end
