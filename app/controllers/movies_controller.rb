class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params.require(:id))
  end

  def index
    @movies = search_scope.page(index_params[:page] || 1)
  end

  private def index_params
    @index_params ||= params.permit(:direction, :genre, :page, :year)
  end

  private def search_scope
    direction = (index_params[:direction] == 'desc') ? :desc : :asc
    scope = Movie.order(releaseDate: direction)
    if year = index_params[:year]
      scope = scope.where('releaseDate LIKE ?', "#{year}-%")
    end
    if genre = index_params[:genre]
      scope = scope.where('UPPER(genres) LIKE ?', "%\"#{genre.upcase}\"%")
    end
    scope
  end
end
