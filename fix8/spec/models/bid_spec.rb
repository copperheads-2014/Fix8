require 'rails_helper'

RSpec.describe Bid, :type => :model do
  let(:bid) {Bid.new(contractor_id: 1, job_id: 1, comment: "This is a Bid Comment", accepted: false)}

  describe 'Review Validations' do
    it "is valid with a price, contractor_id and job_id" do
      bid = Bid.new(contractor_id: 1, job_id: 1, price: 10)
      bid.valid?
      expect(bid.errors).to_not include("can't be blank")
    end
    it "is invalid without a contractor_id" do
      bid = Bid.new(contractor_id: nil)
      bid.valid?
      expect(bid.errors[:contractor_id]).to include("can't be blank")
    end
    it "is invalid without a job_id" do
      bid = Bid.new(job_id: nil)
      bid.valid?
      expect(bid.errors[:job_id]).to include("can't be blank")
    end
    it "is invalid without a price" do
      bid = Bid.new(price: nil)
      bid.valid?
      expect(bid.errors[:price]).to include("can't be blank")
    end
    it "returns a bid's price as an integer" do
      bid = Bid.new(price: "string")
      bid.valid?
      expect(bid.errors[:price]).to include("is not a number")
    end
  end
end