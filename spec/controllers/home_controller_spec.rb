require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  let(:landlord) { User.create(name: 'landlord', email: 'landlord@landlord.com', password: 'test123', password_confirmation: 'test123', phone_number: 'phone', address: 'address', user_type: 'landlord') }
  let(:contractor) { User.create(name: 'contractor', email: 'contractor@contractor.com', password: 'test123', password_confirmation: 'test123', phone_number: 'phone', address: 'address', user_type: 'contractor') }

  describe "GET index" do
    it "returns http success" do
      session[:user_id] = contractor.id
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns should not render landlord page if user is contractor' do
      session[:user_id] = contractor.id
      get :index
      # assert_template partial: 'home/landlord_home'
      p response.body
      expect(response).to render_template partial: 'landlord_home'
    end

  end

end
