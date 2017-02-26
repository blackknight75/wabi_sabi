require 'rails_helper'

RSpec.feature 'home page visitation' do
  xdescribe 'when visiting the home page' do
    scenario 'a visitor will see login' do

      visit root_path
      save_and_open_page
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Wabi Sabi Home Page")
    end
  end

  xdescribe 'when unauthenticated visitor visits log in' do
    scenario 'they see sign up' do

      visit root_path
      click_on "Sign Up"

      users = User.count
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Create New Account")

      fill_in "user[first_name]", with: "Daniel"
      fill_in "user[last_name]", with: "Olson"
      fill_in "user[username]", with: "B1"
      fill_in "user[email]", with: "abc@gmail.com"
      fill_in "user[password]", with: "password"
      fill_in "user[confirmation_password]", with: "password"
      click_on "Create Account"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Daniel")
      expect(page).to have_content("D1")
      expect(User.count).to eq(users + 1)

    end
  end
end
