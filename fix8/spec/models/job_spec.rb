require 'rails_helper'

RSpec.describe Job, :type => :model do
  let(:job) {Job.new(property_id: 1, description: 'This is a job description', start_date: '2014-12-11 08:40:43 -0600', end_date: '2014-12-11 08:40:43 -0600', max_bid: 200, bid_length: 2)}
  describe 'Job validations' do

    it 'requires a property id' do
      job.property_id = 1
      expect(job.save).to eq(true)
    end

    it 'requires a description' do
      job.job_description = 'This is a job description'
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
end