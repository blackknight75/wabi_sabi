require 'rails_helper'

RSpec.feature 'admin' do
  describe 'when an admin visits the dashboard' do
    scenario 'they can see a link to view all items' do
      User.create(first_name: "Billy",
               last_name: "Goat",
               username: "billygoat",
               password: "pass",
               address: "123 Any St, Denver, CO 80202",
               email: "billygoat@gmail.com",
               role: 0
              )
      item1 = Item.create(title: "camera1",
                  description: "Nikon, very focusy",
                  price: 100,
                  status: "active",
                  image: "https://www.bhphotovideo.com/images/categoryImages/desktop/325x325/21008-DSLR-Cameras.jpg"
                  )
      item2 = Item.create(title: "camera2",
                  description: "Nikon, very, very focusy",
                  price: 1000,
                  status: "inactive",
                  image: "https://www.bhphotovideo.com/images/categoryImages/desktop/325x325/21008-DSLR-Cameras.jpg"
                  )

      visit login_path
      fill_in 'Username', with: 'billygoat'
      fill_in 'Password', with: 'pass'
      click_button 'Login'
      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_link('View All Items')

      within('.item-management') do
        click_on 'View All Items'
      end
      expect(current_path).to eq("/admin/items")

      within('table') do
        expect(page).to have_content("active")
        expect(page).to have_content("inactive")
      end
    end
  end
end
