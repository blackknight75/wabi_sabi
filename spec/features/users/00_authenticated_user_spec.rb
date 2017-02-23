require 'rails_helper'

RSpec.feature "as a visitor" do
  scenario "I should see a link to login" do
    visit root_path
    click_on "Login"
    expect(current_path).to eq('/login')
    fill_in 'user[username]'
    fill_in 'user[password]'
    fill_in 'user[password_confirmation]'

    click_on "Login"
    expect(current_path).to eq()


  end
end
# As a visitor
# When I visit "/"
# Then I should see a link for "Login"
# And when I click "Login"
# And I should be on the "/login" page
# I should see a place to insert my credentials to login
# And I should see a link to "Create Account"
#
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
