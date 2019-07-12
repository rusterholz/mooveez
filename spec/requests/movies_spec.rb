require 'rails_helper'

RSpec.describe MoviesController do
  describe 'GET #show' do
    let :pattern do
      {
        id: Integer,
        imdb_id: String,
        title: String,
        description: String,
        release_date: String,
        budget: String,
        runtime: Numeric,
        avg_rating: Float,
        genres: [
          {
            id: Integer,
            name: String
          }
        ].ignore_extra_values!,
        language: wildcard_matcher, # matches anything, even null
        production_companies: [
          {
            id: Integer,
            name: String
          }
        ].ignore_extra_values!
      }
    end
    it 'successfully returns the details of a single movie' do
      get movie_path(296)

      expect(response).to have_http_status(:success)
      expect(response.body).to match_json_expression(pattern)
    end
  end

  describe 'GET #index' do
    let :pattern do
      [
        {
          id: Integer,
          imdb_id: String,
          title: String,
          genres: [
            {
                id: Integer,
                name: String
            }
          ].ignore_extra_values!,
          release_date: String,
          budget: String
        }
      ].ignore_extra_values!
    end

    it 'successfully returns a list of movies' do
      get movies_path

      expect(response).to have_http_status(:success)
      expect(response.body).to match_json_expression(pattern)
    end

    it 'allows filtering by year' do
      get movies_path(year: 2003)

      expect(response).to have_http_status(:success)
      expect(response.body).to match_json_expression(pattern)

      JSON.parse(response.body).each do |item|
        expect(item['release_date'][0..3]).to eq '2003'
      end
    end

    it 'provides an alternate route for filtering by year' do
      get movies_by_year_path(1999)

      expect(response).to have_http_status(:success)
      expect(response.body).to match_json_expression(pattern)

      JSON.parse(response.body).each do |item|
        expect(item['release_date'][0..3]).to eq '1999'
      end
    end

    it 'allows filtering by genre name' do
      get movies_path(genre: 'fantasy')

      expect(response).to have_http_status(:success)
      expect(response.body).to match_json_expression(pattern)

      JSON.parse(response.body).each do |item|
        genres = item['genres'].map { |g| g['name'] }
        expect(genres).to include('Fantasy')
      end
    end

    it 'provides an alternate route for filtering by genre' do
      get movies_by_genre_path('comedy')

      expect(response).to have_http_status(:success)
      expect(response.body).to match_json_expression(pattern)

      JSON.parse(response.body).each do |item|
        genres = item['genres'].map { |g| g['name'] }
        expect(genres).to include('Comedy')
      end
    end
  end
end
