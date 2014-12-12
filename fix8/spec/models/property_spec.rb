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

  describe



end