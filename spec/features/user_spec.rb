require 'rails_helper'

describe "User authentication" do
  it "user creates a valid account" do
    visit '/users/new'
    fill_in 'user_email', :with => "user@example.com"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password"
    click_button "Create Account"
    expect(page).to have_text("Success")
  end

  it "returns to the same page if passwords do not match" do
    visit '/users/new'
    fill_in 'user_email', :with => "user@example.com"
    fill_in 'user_password', :with => "password"
    fill_in 'user_password_confirmation', :with => "password1"
    click_button "Create Account"
    expect(page).to have_text("Password")
  end

end
