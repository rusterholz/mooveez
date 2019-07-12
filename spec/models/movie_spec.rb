require 'rails_helper'

RSpec.describe Movie do
  it_behaves_like 'read-only'

  it do
    should have_many(:ratings).with_foreign_key('movieId').inverse_of(:movie)
  end

  describe 'avg_rating' do
    let(:instance) { described_class.first }

    it 'returns the mean of the scores from associated rating objects' do
      expect(instance).to receive(:ratings).and_return(
        [5, 11, 17, 23].map { |score| Rating.new(rating: score) }
      )
      expect(instance.avg_rating).to eq(14.0)
    end

    it 'returns nil if there are no associated rating objects' do
      expect(instance).to receive(:ratings).and_return([])
      expect(instance.avg_rating).to be_nil
    end
  end
end
