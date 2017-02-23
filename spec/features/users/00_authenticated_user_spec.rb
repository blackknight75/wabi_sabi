require 'rails_helper'

RSpec.feature "as a visitor" do
  scenario "I should see a link to login" do
    visit root_path
    click_on "Login"
    expect(current_path).to eq('/login')
    fill_in 'user[username]', with: "Billy"
    fill_in 'user[password]', with: "pass"
    fill_in 'user[password_confirmation]', with: "pass"

    click_on "Login"
    expect(current_path).to eq("/dashboard")
  end

  scenario "visitor can create an account" do
    visit root_path
    click_on "Login"
    expect(current_path).to eq('/login')
    click_on "Create Account"
    expect(current_path).to eq('/signup')

    fill_in "login[username]", with "Sally"
    fill_in "login[email]", with "Sally@email.com"
    fill_in "login[address]", with "123 2nd St"
    fill_in "login[password]", with "pass"
    fill_in "login[password_confimation]", with "pass"

    click_on "Save New Account"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content
  end
end

# As a visitor
# When I visit "/login
# And when I click link "Create Account"
# And I fill in my desired credentials
# And I submit my information
# Then my current page should be "/dashboard"
# And I should see a message in the navbar that says "Logged in as SOME_USER"
# And I should see my profile information
# And I should not see a link for "Login"
# And I should see a link for "Logout"
