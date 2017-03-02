require 'rails_helper'

RSpec.feature "logout" do
  describe "successful admin logout" do
    scenario "admin clicks 'logout' on userpage" do
      admin = User.create(first_name: "Brandon",
                        last_name: "Rand",
                        username: "B1",
                        password: "password",
                        role: 0)

      visit login_path
      fill_in "session[username]", with: admin.username
      fill_in "session[password]", with: admin.password
      within('.login-form') do
        click_on "Login"
      end

      expect(current_path).to eq(admin_dashboard_path)

        click_on "Log Out"

      expect(current_path).to eq(root_path)

      within('.nav-wrapper') do
        expect(page).to_not have_content("Logout")
      end
    end
  end
end
