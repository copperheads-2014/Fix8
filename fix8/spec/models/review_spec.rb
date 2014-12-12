require 'rails_helper'

RSpec.describe Review, :type => :model do
  let!(:review) { Review.new(description: "Description", rating: 10, review_type: 0, bid_id: 1) }

  describe 'validations' do
    context 'bid' do
      it 'requires the presence of a bid' do
        review.bid_id = nil
        review.save
        expect(review.errors[:bid_id]).to include("can't be blank")
      end

      it 'only allows a landlord to give review once for a bid' do
        review.save
        review2 = Review.create(description: "Description1", rating: 5, review_type: 0, bid_id: 1)
        expect(review2.errors[:bid_id]).to include('has already been taken')
      end

      it 'only allows a contractor to give review once for a bid' do
        review2 = Review.create(description: "Description", rating: 5, review_type: 1, bid_id: 1)
        review3 = Review.create(description: "Description", rating: 5, review_type: 1, bid_id: 1)
        expect(review3.errors[:bid_id]).to include('has already been taken')
      end
    end
end
