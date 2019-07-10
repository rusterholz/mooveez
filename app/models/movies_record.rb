# A base class for all records stored in movies.db.
class MoviesRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :movies
end
