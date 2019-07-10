# A base class for all records stored in ratings.db.
class RatingsRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :ratings
end
