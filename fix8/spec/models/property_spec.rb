require 'rails_helper'

RSpec.describe Property, :type => :model do
  let(:property) {Property.new(owner_id: 1, name: "The Lucas", address: "123 Aussie Boulevard")}

  describe 'Validations' do
    it "is valid with an owner_id, name and address" do
      property = Property.new(owner_id: 1, name: "The Lucas", address: "123 Aussie Boulevard")
      property.valid?
      expect(property.errors).to_not include("can't be blank")
    end
    it "is invalid without a owner_id" do
      property = Property.new(owner_id: nil)
      property.valid?
      expect(property.errors[:owner_id]).to include("can't be blank")
    end
    it "is invalid without a name" do
      property = Property.new(name: nil)
      property.valid?
      expect(property.errors[:name]).to include("can't be blank")
    end
    it "is invalid without an address" do
      property = Property.new(address: nil)
      property.valid?
      expect(property.errors[:address]).to include("can't be blank")
    end
  end

  describe 'Associations' do

    it 'has a landlord' do
      grant = User.create(name: 'Grant', email: 'gphummer@gmail.com', password: 'testtest', address: '666 elm st')
      property.landlord = grant
      expect(property.landlord.name).to eq('Grant')
    end

    it 'has many jobs' do
      job = Job.new(description: 'This is a job description', start_date: '2014-12-11 08:40:43 -0600', end_date: '2014-12-11 08:40:43 -0600', max_bid: 200, bid_length: 2)
      job2 = Job.new(description: 'This is another description', start_date: '2014-12-11 08:40:43 -0600', end_date: '2014-12-11 08:40:43 -0600', max_bid: 400, bid_length: 7)
      property.jobs << job
      property.jobs << job2
      expect(property.jobs.size).to eq(2)
    end



  end



end