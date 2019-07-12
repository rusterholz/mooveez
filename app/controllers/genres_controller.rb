class GenresController < ApplicationController
  def index
    @genres = Movie.pluck(:genres)
      .map{ |g| Array(JSON.parse(g)) }
      .reduce(:+)
      .uniq
      .map{ |h| h['name'] }
      .sort
  end
end
