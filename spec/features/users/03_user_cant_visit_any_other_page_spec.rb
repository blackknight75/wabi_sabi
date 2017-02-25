require 'rails_helper'

RSpec.feature 'logged in regular user cannot view any other page but its own' do
  describe "if a user attempts to visit another page"  do
    it 'a user cant see another user info' do
      user = User.create(username: "BB King",
                        email: "br.mhcexchange@gmail.com",
                        password: "b"
                        )
      user1 = User.create(username: "user 1",
                          email: "br@gmail.com",
                          password: "x"
                          )
      allow_any_instance_of(ApplicationController)
                            .to receive(:current_user)
                            .and_return(user)

      visit dashboard_path

      expect(page).to have_content("My Account")
      expect(page).to have_content(user.email)
      visit dashboard_path
      # visit user_path(user1.id)
      expect(page).to have_content("My Account")
      expect(page).to have_content(user.email)
      expect(current_path).to eq(dashboard_path)
      # expect(current_path).to eq(user_path(user.id))

    end
  end
  #
  # visit "/admin"
  #
  # # expect(current_path).to eq("/500")
  # expect(page).to have_content("Errors 500 internal_server_error")


end