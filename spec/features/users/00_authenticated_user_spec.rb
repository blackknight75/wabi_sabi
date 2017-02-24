require 'rails_helper'

RSpec.feature "as a visitor" do
  scenario "I should see a link to login" do
    User.create(first_name: "Billy",
             last_name: "Goat",
             username: "billygoat",
             password: "pass",
             address: "123 Any St, Denver, CO 80202",
             email: "billygoat@gmail.com"
            )

    visit root_path

    within('.navbar') do
      click_on "Login"
    end


    expect(current_path).to eq('/login')

    fill_in 'session[username]', with: "billygoat"
    fill_in 'session[password]', with: "pass"
    fill_in 'session[password_confirmation]', with: "pass"

    within('.login-form') do
      click_on "Login"
    end

    expect(current_path).to eq("/dashboard")
  end

  scenario "visitor can create an account" do
    visit root_path
    click_on "Login"
    expect(current_path).to eq('/login')
    click_on "Create Account"
    expect(current_path).to eq('/signup')

    fill_in "user[username]", with: "Sally123"
    fill_in "user[first_name]", with: "Silly"
    fill_in "user[last_name]", with: "Sally"
    fill_in "user[email]", with: "Sally@email.com"
    fill_in "user[address]", with: "123 2nd St"
    fill_in "user[password]", with: "pass"
    fill_in "user[password_confirmation]", with: "pass"

    click_on "Save New Account"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as Silly")
    expect(page).to have_content("Sally@email.com")
    expect(page).to have_content("123 2nd St")
    save_and_open_page
    within('.navbar')do
      expect(page).to_not have_content("Login")
      expect(page).to have_content("")
    end
  end
end
