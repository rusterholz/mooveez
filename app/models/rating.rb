class Rating < RatingsRecord
  include ReadOnly

  self.primary_key = 'ratingId'
end
