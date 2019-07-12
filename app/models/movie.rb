class Movie < ApplicationRecord
  include ReadOnly

  self.primary_key = 'movieId'

  has_many :ratings, inverse_of: :movie, foreign_key: 'movieId'

  def avg_rating
    scores = ratings.pluck(:rating)
    scores.present? ? scores.sum.to_f / scores.count : nil
  end
end
