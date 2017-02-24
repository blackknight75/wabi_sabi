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

    fill_in "login[username]", with: "Sally123"
    fill_in "login[first_name]", with: "Silly"
    fill_in "login[last_name]", with: "Sally"
    fill_in "login[email]", with: "Sally@email.com"
    fill_in "login[address]", with: "123 2nd St"
    fill_in "login[password]", with: "pass"
    fill_in "login[password_confimation]", with: "pass"

    click_on "Save New Account"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as Sally")
    expect(page).to have_content("Sally@email.com")
    expect(page).to have_content("123 2nd St")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end
end
