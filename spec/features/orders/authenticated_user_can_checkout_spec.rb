require 'rails_helper'

describe 'when a visitor adds items to cart' do
  xscenario ' they visit cart and click on login' do
    user = User.create(username: "sally", email: "sally@email.com", password: "pass", role: 1)

    visit root_path

    within('.nav-wrapper') do
      click_on "Cart"
    end
    click_on "Login"

    fill_in "Username", with: "sally"
    fill_in "Password", with: "pass"

    expect(current_path).to eq dashboard_path

    within('.nav-wrapper') do
      click_on "Cart"
    end
    click_on "Checkout"

    expect(current_path).to eq user_orders_path(user)
    expect(page).to have_content("Order was successfully placed")
    within('.current-orders') do
      expect(page).to have_content("Order #{ORDER_ID} DATE")
    end
  end
end
