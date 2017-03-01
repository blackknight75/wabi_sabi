require 'rails_helper'

RSpec.feature "logout" do
  describe "successful logout" do
    scenario "user clicks 'logout' on userpage" do
      user = User.create(first_name: "George",
                         username: "S1",
                         password: "password",
                         role: 1
                        )

      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password

      within('.login-form') do
        click_on "Login"
      end


      expect(current_path).to eq dashboard_path

      within('.nav-wrapper') do
        click_on "Log Out"
      end

      # expect(page).to have_content("You have successfully logged out.")
      expect(current_path).to eq(root_path)

      within('.nav-wrapper') do
        expect(page).to have_content("Login")
      end
    end
  end
end
