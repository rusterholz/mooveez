class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:releaseDate).page(index_params[:page] || 1)
  end

  private def index_params
    params.permit(:page)
  end

  def show
    @movie = Movie.find(params.require(:id))
    puts @movie
  end

  private def show_id

  end
end
