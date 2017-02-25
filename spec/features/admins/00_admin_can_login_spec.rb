require 'rails_helper'

RSpec.feature "Admin: " do
  context "not logged in" do
    it "can log in" do
      user = User.create(name: "Brandon",
                          username: "Brandon1985",
                          password: "password",
                          role: 1)
      visit login_path

      fill_in "session[username]", with: "Brandon1985"
      fill_in "session[password]", with: "password"
      click_on "Log In"

      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_link("Add a Product")

      within("p") do
        expect(page).to have_content("Administrator")
      end
    end
  end
