require "rails_helper"

#As an Admin
#When I visit the dashboard
#Then I can see a listing of all orders
#And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
#And I can see a link for each individual order
#And I can filter orders to display by each status type ("Ordered", "Paid", "Cancelled", "Completed")
#And I have links to transition between statuses
#- I can click on "cancel" on individual orders which are "paid" or "ordered"
#- I can click on "mark as paid" on orders that are "ordered"
#- I can click on "mark as completed" on orders that are "paid"

RSpec.feature 'admin visual' do
  describe 'when an admin visits the dashboard' do
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
    within all('.item-card').first do
      click_on "Add to Cart"
  end
    within('.item-card:nth-child(2)') do
      click_on "Add to Cart"
  end
    within('.item-card:nth-child(1)') do
      click_on "Add to Cart"
  end

  click_on "View Cart"
  click_on "checkout"
end
