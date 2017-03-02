require 'rails_helper'

RSpec.feature "Admin: " do
  context "not logged in" do
    it "can log in" do
      user = User.create(first_name: "Billy",
               last_name: "Goat",
               username: "billygoat",
               password: "pass",
               address: "123 Any St, Denver, CO 80202",
               email: "billygoat@gmail.com",
               role: 1
              )
      visit login_path

      fill_in "session[username]", with: "billygoat"
      fill_in "session[password]", with: "pass"

      within('.login-form') do
        click_on "Login"
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to_not have_link("Add New Product")
      expect(current_path).to_not eq(admin_dashboard_path)
    end
  end
end
