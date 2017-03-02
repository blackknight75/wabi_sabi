require 'rails_helper'

describe 'when an authenticated user visits orders page' do
  scenario 'they can click on a past order and see all items in order' do

    user = User.create(first_name: "Brandon",
                      last_name: "Randall",
                      username: "B1",
                      password: "password",
                      role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    cart_setup
    visit cart_path
    click_on "checkout"

    within('.nav-wrapper') do
      click_on 'My Orders'
    end
    click_on "Order#: #{Order.last.id}"

    expect(page).to have_content("Matcha")
    expect(page).to have_content("Stuff")
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
