require 'rails_helper'

RSpec.feature 'home page visitation' do
  describe 'when visiting the home page' do
    scenario 'a visitor will see login' do

      visit root_path
      expect(current_path).to eq(root_path)
      within('.nav-wrapper') do
        expect(page).to have_content("わびさび Wabi-Sabi")
      end
    end
  end

  describe 'when unauthenticated visitor visits log in' do
    scenario 'they see sign up' do

      visit login_path

      click_on "Create Account"
      expect(current_path).to eq signup_path
      fill_in "user[first_name]", with: "Daniel"
      fill_in "user[last_name]", with: "Olson"
      fill_in "user[username]", with: "B1"
      fill_in "user[email]", with: "abc@gmail.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Save New Account"

      expect(current_path).to eq dashboard_path
      expect(page).to have_content("Daniel")
      expect(User.count).to eq(1)
    end
  end
end
