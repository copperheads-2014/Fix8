require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {User.new(email: 'a@a.com', password: 'test123', password_confirmation: 'test123', user_type: 'landlord', address: '123 Fake Street', name: "name", phone_number: "801-123-4567")}
  describe 'validations' do
    context 'password' do
      it 'requires the password to be a minimum of 6 characters' do
        user.password = 'test'
        user.password_confirmation = 'test'
        expect(user.save).to eq(false)
      end
    end

    context 'user type' do
      it 'allows landlord as an user type' do
        user.user_type = 'landlord'
        expect(user.save).to eq(true)
      end

      it 'allows contractor as an user type' do
        user.user_type = 'contractor'
        expect(user.save).to eq(true)
      end
    end

    context 'email' do
      it 'requires email to have @' do
        user.email = "abc.com"
        expect(user.save).to eq(false)
      end

      it 'requires email to have a letter between @ and .' do
        user.email = "abc@.com"
        expect(user.save).to eq(false)
      end

      it 'requires email to have two letters after .' do
        user.email = "abc@a.c"
        expect(user.save).to eq(false)
      end

      it 'requires email to be unique' do
        user2 = user.clone
        user.save
        expect(user2.save).to eq(false)
      end
    end

    context 'address' do
      it 'requires address to be present' do
        user.address = nil
        expect(user.save).to eq(false)
      end
    end

    context 'name' do
      it 'requires name to be present' do
        user.name = nil
        user.save
        expect(user.errors[:name]).to include("can't be blank")
      end
    end

    context 'phone number' do
      it 'requires phone number to be present' do
        user.phone_number = nil
        user.save
        expect(user.errors[:phone_number]).to include("can't be blank")
      end
    end
  end

  describe 'associations' do
    let!(:landlord) {User.create(name: 'landlord', email: 'landlord@landlord.com', password: 'test123', password_confirmation: 'test123', phone_number: '123-456-7890', address: 'address', user_type: 0)}
    let!(:contractor) {User.create(name: 'contractor', email: 'contractor@contractor.com', password: 'test123', password_confirmation: 'test123', phone_number: '123-456-7890', address: 'address', user_type: 0)}

    context 'bids' do
      it 'stores bids for a contractor' do
        bid = double("bid")
        allow(contractor.bids).to receive(:<<) { bid }
      end
    end
  end
end
