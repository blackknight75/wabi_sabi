require 'rails_helper'

RSpec.feature "Admin: " do
  context "not logged in" do
    it "can log in" do
      user = User.create(first_name: "Brandon",
                          username: "Brandon1985",
                          password: "password",
                          role: 1)
      visit login_path

      fill_in "session[username]", with: "Brandon1985"
      fill_in "session[password]", with: "password"

      within('.login-form') do
        click_on "Login"
      end

      expect(current_path).to eq(dashboard_path)
      expect(page).to_not have_link("Add New Product")
      expect(current_path).to_not eq(admin_dashboard_path)
    end
  end
end
