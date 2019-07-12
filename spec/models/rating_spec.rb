require 'rails_helper'

RSpec.describe Rating do
  it_behaves_like 'read-only'

  it do
    should belong_to(:movie).with_foreign_key('movieId').inverse_of(:ratings)
  end
end
