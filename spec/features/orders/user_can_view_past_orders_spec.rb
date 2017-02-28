require 'rails_helper'

RSpec.feature "as a user" do
  scenario "I can see my past orders" do
    user_setup
    cart_setup
    visit orders_path
  expect(page).to have_content("My Orders")
  expect(page).to have_link(Order.last.id)
  click_on "#{Order.last.id}"
  expect(page).to have_content("Subtotal: 200")
  expect(page).to have_content("Quantity: 2")
  expect(page).to have_content("Price: 100")
  expect(page).to have_content("Name: Matcha")
  expect(page).to have_content("Order Status: Ordered")
  expect(page).to have_content("Order Date:")
  expect(page).to have_content("Order Total: 300")
  end
end

def user_setup
  user = User.create(username: "sally", email: "sally@email.com", password: "pass")
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
end

def cart_setup
  item = Item.create(title: "Matcha",
                     description: "Green Tea",
                     price: 100)
  Item.create(title: "Stuff",
                     description: "Green Stuff",
                     price: 100)

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
  expect(current_path).to eq orders_path
end
