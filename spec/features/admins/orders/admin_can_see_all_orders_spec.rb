require "rails_helper"

RSpec.feature 'admin visual' do
  xdescribe 'when an admin visits the dashboard' do
    it 'they can see a listing of all orders' do
      admin = User.create(first_name: "Brandon",
                        username: "B1",
                        password: "password",
                        role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      inventory_setup
      order_setup
      order_setup

      visit admin_dashboard_path
      expect(page).to have_content("Manage Orders")
      click_on "Order#: #{Order.last.id}"

      expect(current_path).to eq(order_path(Order.last))
    end
  end
  scenario 'admin can see orders by status with counts for each status' do
    admin = User.create(first_name: "Brandon",
                      username: "B1",
                      password: "password",
                      role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    inventory_setup
    order_setup
    order_setup

    visit admin_dashboard_path
    Order.first.order_items[0].update_attributes(status: "Paid")
  end
end

def inventory_setup
  item = Item.create(title: "Matcha",
                     description: "Green Tea",
                     price: 100)
  Item.create(title: "Stuff",
                     description: "Green Stuff",
                     price: 100)
end

def order_setup
  visit root_path

    within all('.card-action')[1] do
      click_link "Add to Cart"
  end

    within all('.card-action')[1] do
      click_link "Add to Cart"
  end
  
within '.nav-wrapper' do
  click_on "Cart"
end

  click_on "checkout"
end
