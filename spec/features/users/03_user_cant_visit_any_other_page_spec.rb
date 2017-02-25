require 'rails_helper'

RSpec.feature 'logged in user cannot view any other page but its own' do
  describe "if a user attempts to visit another page"  do
    it 'will be routed to either the current page or an error page' do
      user = User.create(username: "BB King",
                        email: "br.mhcexchange@gmail.com",
                        password: "b"
                        role: 0)
      user1 = User.create(username: "user 1",
                          email: "br@gmail.com",
                          password: "x"
                          role: 1)
      allow_any_instance_of(ApplicationController)
                            .to receive(:current_user)
                            .and_return(user)

      visit dashboard_path
      # save_and_open_page

      expect(page).to have_content("My Account")
      expect(page).to have_content(user.email)
      visit user_path(user1.id)
      expect(page).to have_content("My Account")
      expect(page).to have_content(user.email)

      visit "/admin"

      # expect(current_path).to eq("/500")
      save_and_open_page
      expect(page).to have_content("Errors 500 internal_server_error")
    end
  end
end
