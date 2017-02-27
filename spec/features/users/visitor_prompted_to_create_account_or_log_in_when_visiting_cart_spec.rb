require 'rails_helper'

describe "when a visitor visits cart with items" do
  scenario "they must log in or create an account to checkout" do
    Item.create(title: "Matcha",
                        description: "Green Tea",
                        price: 100
                       )
    cart_setup
    visit root_path

    within('.item-card:nth-child(1)') do
      click_on "Add to Cart"
    end

    click_on "View Cart"
    within('.checkout') do
      expect(page).to have_button("Login or Create Account to Checkout")
    end
    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")
    expect(page).to have_content("100")
    expect(page).to_not have_content("Checkout")

    within('.checkout') do
      click_on "Login or Create Account to Checkout"
    end

    expect(current_path).to eq signup_path
    fill_in "user[username]", with: "Sally"
    fill_in "user[email]", with: "Sally@email.com"
    fill_in "user[address]", with: "123 2nd St"
    fill_in "user[password]", with: "pass"
    fill_in "user[password_confirmation]", with: "pass"

    click_on "Save New Account"
    visit cart_path
    expect(page).to_not have_content("Login or Create Account to Checkout")
    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")
    expect(page).to have_content("100")
    expect(page).to have_button("checkout")
  end

  scenario 'when user is logged in they can click and checkout' do

    cart_setup
    user_setup

    visit cart_path

    expect(page).to have_button("checkout")
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

  expect(current_path).to eq cart_path
    within('.item-card:nth-child(1)') do
    end
  end
end
