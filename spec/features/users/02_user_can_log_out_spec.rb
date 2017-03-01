require 'rails_helper'

RSpec.feature "logout" do
  xdescribe "successful logout" do
    scenario "user clicks 'logout' on userpage" do
      user = User.create(name: "Spencer",
                         username: "S1",
                         password: "password",
                         role: 1
                        )

      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_on "Log In"

      expect(current_path).to eq(user_path(user.id))

      click_on "Log Out"

      # expect(page).to have_content("You have successfully logged out.")
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Log In")
    end
  end
end
