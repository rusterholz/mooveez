require 'rails_helper'

RSpec.describe GenresController do
  describe 'GET #index' do
    let :pattern do
      [
        {
          genre: String,
          movies: String
        }
      ].ignore_extra_values!
    end
    it 'successfully returns an index of available genres' do
      get genres_path

      expect(response).to have_http_status(:success)
      expect(response.body).to match_json_expression(pattern)
    end
  end
end
