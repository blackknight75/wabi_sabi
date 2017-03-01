require 'rails_helper'

describe 'when a visitor adds items to cart' do
  scenario ' they visit cart and click on login' do
    user = User.create(first_name: "Nil", username: "sally", email: "sally@email.com", password: "pass", role: 1)

    visit root_path

    within('.nav-wrapper') do
      click_on "Cart"
    end
    within('.checkout') do
      click_on "Login"
    end

    fill_in "Username", with: "sally"
    fill_in "Password", with: "pass"

    within('.login-form') do
      click_on "Login"
    end

    expect(current_path).to eq dashboard_path

    within('.nav-wrapper') do
      click_on "Cart"
    end
    within('.checkout') do
      click_on "checkout"
    end

    expect(current_path).to eq orders_path
    expect(page).to have_content("Order was successfully placed")
  end
end
