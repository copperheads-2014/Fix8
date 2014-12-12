require 'rails_helper'

describe 'home' do
  let(:landlord) { User.create(name: 'landlord', email: 'landlord@landlord.com', password: 'test123', password_confirmation: 'test123', phone_number: 'phone', address: 'address') }
  let(:contractor) { User.create(name: 'contractor', email: 'contractor@contractor.com', password: 'test123', password_confirmation: 'test123', phone_number: 'phone', address: 'address') }

  it 'shows the correct content for a landlord' do
    landlord
    visit '/home'

    expect(page).to have_content("current jobs")
  end
end
