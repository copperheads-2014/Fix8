require 'rails_helper'

RSpec.describe Job, :type => :model do
  let(:job) { Job.new(property_id: 1, description: 'This is a job description', start_date: '2014-12-11 08:40:43 -0600', end_date: '2014-12-11 08:40:43 -0600', max_bid: 200, bid_length: 2) }
  # let(:bid) { Bid.new(price: 1000, contractor_id: 1, job_id: 1, comment: 'no comment', accepted: false) }
  # let(:bid2) { Bid.new(price: 500, contractor_id: 2, job_id: 1, comment: 'Cheap!', accepted: false) }
  describe 'validations' do

    it 'requires a property id' do
      job.property_id = 1
      expect(job.save).to eq(true)
    end

    it 'requires a description' do
      job.description = 'This is a job description'
      expect(job.save).to eq(true)
    end

    it 'requires a start_date' do
      job.start_date = ""
      expect(job.save).to eq(false)
    end

    it 'requires an end_date' do
      job.end_date = ""
      expect(job.save).to eq(false)
    end

    it 'requires a max bid .' do
      job.max_bid = 200
      expect(job.save).to eq(true)
    end

  end

  describe 'associations' do

  it 'returns an ActiveRecord association array of bids' do
    job.bids << Bid.new(price: 500, contractor_id: 2, comment: 'Cheap!', accepted: false)
    # job.bids << bid2
    expect(job.bids.count).to eq(2)
  end


  end

end