require 'rails_helper'

describe ' when a user visits their cart' do
  scenario ' they click on checkout and order is placed' do
    user = User.create(first_name: "Jonny 5", username: "sally", email: "sally@email.com", password: "pass", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

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

    within('.nav-wrapper') do
      click_on "Cart"
    end

    expect(current_path).to eq cart_path

    click_on "checkout"
    expect(current_path).to eq orders_path
    expect(page).to have_content("Order was successfully placed")
  end
end
