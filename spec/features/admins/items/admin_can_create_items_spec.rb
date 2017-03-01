require "rails_helper"

describe 'When an admin visits item new page' do
  scenario 'they can create a new item' do
    admin = User.create(first_name: "Brandon",
                      username: "B1",
                      password: "password",
                      role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_item_path

    fill_in 'item[title]', with: "Chopsticks"
    fill_in 'item[description]', with: "Wooden sticks."
    fill_in 'item[price]', with: 5
    fill_in 'item[image]', with: "http://i.imgur.com/RbzANbF.jpg"

    click_on 'Add Item to Inventory'

    expect(current_path).to eq admin_items_path
    expect(page).to have_content("Chopsticks")
    expect(page).to have_content("Wooden sticks.")
    expect(page).to have_content("5")
    expect(page).to have_xpath("//img[contains(@src,'http://i.imgur.com/RbzANbF.jpg')]")
  end
end
