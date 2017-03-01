require 'rails_helper'

RSpec.feature "as an admin" do
  scenario "I can edit exisiting items" do
    admin = User.create(first_name: "Brandon",
                      username: "B1",
                      password: "password",
                      role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    item1 = Item.create(title: "Matcha",
                        description: "Green Tea",
                        price: 100
                        )
    visit'admin/items'
    click_on "Edit"

    fill_in "item[title]", with: "Bubbles"
    fill_in "item[status]", with: "Retired"
    fill_in "item[image]", with: "http://dreamatico.com/data_images/bubble/bubble-7.jpg"
    fill_in "item[description]", with: "semi-permeable membrane"
    expect(current_path).to eq(edit_admin_item_path(item1.id))
  end
end
