require 'rails_helper'

RSpec.feature "logout" do
  describe "successful admin logout" do
    scenario "admin clicks 'logout' on userpage" do
      admin = User.create(name: "Brandon",
                        username: "B1",
                        password: "password",
                        role: 1)

      visit login_path
      fill_in "session[username]", with: admin.username
      fill_in "session[password]", with: admin.password
      click_on "Log In"

      expect(current_path).to eq(user_path(admin.id))

      click_on "Log Out"

      # expect(page).to have_content("You have successfully logged out.")
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Log In")
    end
  end
end
