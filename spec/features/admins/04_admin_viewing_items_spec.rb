require 'rails_helper'

##As an Admin
##When I visit "/admin/dashboard"
##Then I should see a link for viewing all items
##And when I click that link
##Then my current path should be "/admin/items"
##Then I should see a table with all items (active and inactive)
##And each item should have:
#- A thumbnail of the image
#- Title that links to the item
#- Description
#- Status
#- Actions (Edit)

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
      # save_and_open_page
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

  xdescribe 'the admin/items' do
    scenario 'each item should have a title that links to the item,
              thumbnail, description, status, actions' do
      User.create(first_name: "Billy",
               last_name: "Goat",
               username: "billygoat",
               password: "pass",
               address: "123 Any St, Denver, CO 80202",
               email: "billygoat@gmail.com",
               role: 0
              )
      Item.create(item: "camera",
                  description: "Nikon, very focusy",
                  price: 100,
                  image: "https://www.bhphotovideo.com/images/categoryImages/desktop/325x325/21008-DSLR-Cameras.jpg"
                  )
      visit "admin_dashboard"
      click_on 'Login'
      fill_in 'Username', with: 'billygoat'
      fill_in 'Password', with: 'pass'
      save_and_open_page
      expect(page).to have_content('View All Items')

      click_on 'View All Items'
      expect(page).to have_content('Nikon')
      expect(current_path).to eq("/admin/items")

      expect(page).to have_content()#image_thumbnail
      expect(page).to have_content()#image that links to item
      expect(page).to have_content("Description:")
      expect(page).to have_content("Status:")
      expect(page).to have_link("Edit:")
    end
  end
end
