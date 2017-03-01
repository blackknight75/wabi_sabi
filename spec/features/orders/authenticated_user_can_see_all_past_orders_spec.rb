require 'rails_helper'

describe 'when a user visits the orders page' do
  scenario 'they see all past orders' do
    user = User.create(first_name: "George", username: "sally", email: "sally@email.com", password: "pass", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    cart_setup
    visit cart_path
    click_on "checkout"

    within('.nav-wrapper') do
      click_on 'My Orders'
    end

    expect(page).to have_content("My Orders")
    expect(page).to have_content("Order#: #{Order.last.id}")
  end
end

def cart_setup
  item = Item.create(title: "Matcha",
                     description: "Green Tea",
                     price: 100)
  Item.create(title: "Stuff",
                     description: "Green Stuff",
                     price: 100)

  visit root_path

  within all('.card-action')[0] do
    click_link "Add to Cart"
  end

  within all('.card-action')[1] do
    click_link "Add to Cart"
  end

  within all('.card-action')[0] do
    click_link "Add to Cart"
  end
end
