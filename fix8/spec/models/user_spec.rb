require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {User.new(email: 'a@a.com', password: 'test123', password_confirmation: 'test123', user_type: 'landlord', address: '123 Fake Street')}
  describe 'validations' do
    it 'requires the password to be a minimum of 6 characters' do
      user.password = 'test'
      user.password_confirmation = 'test'
      expect(user.save).to eq(false)
    end

    it 'allows landlord as an user type' do
      user.user_type = 'landlord'
      expect(user.save).to eq(true)
    end

    it 'allows contractor as an user type' do
      user.user_type = 'contractor'
      expect(user.save).to eq(true)
    end

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

    it 'requires address to be present' do
      user.address = nil
      expect(user.save).to eq(false)
    end
  end
end
