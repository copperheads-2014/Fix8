require 'rails_helper'

RSpec.describe Job, :type => :model do
  let(:job) { Job.new(property_id: 1, description: 'This is a job description', start_date: '2014-12-11 08:40:43 -0600', end_date: '2014-12-11 08:40:43 -0600', max_bid: 200, bid_length: 2) }
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
      job.bids << Bid.new(price: 50, contractor_id: 2, comment: 'Cheap!', accepted: false)
      job.bids << Bid.new(price: 150, contractor_id: 2, accepted: false)
      expect(job.bids.size).to eq(2)
    end

    it "does not allow a bid to be placed which is over the max bid size" do
      # This feature is tricky to implement. Might need some logic in the Job model which references the bid model?
      job.bids << Bid.new(price: 50, contractor_id: 2, comment: 'Cheap!', accepted: false)
      expect(job.bids.size).to eq(0)
    end

    it "requires skills" do
      skill = Skill.create(name: 'Plumbing')
      job.skills << skill
      expect(job.skills.size).to eq(1)
    end

    it "belongs to a property" do
      property = Property.create(owner_id: 1, name: 'Trump Tower', address: "666 Elm St")
      job.property_id = 1
      job.save
      expect(job.property.name).to eq('Trump Tower')
    end

  end

end