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
      expect(page).to have_content("br.mhcexchange@gmail.com")

      visit '/users/2'

      expect(page).to have_content("My Account")
      expect(page).to have_content("br.mhcexchange@gmail.com")
      expect(page).to_not have_content("br@gmail.com")

      visit '/admin'
      expect(page).to have_content("404")
    end
  end
end
