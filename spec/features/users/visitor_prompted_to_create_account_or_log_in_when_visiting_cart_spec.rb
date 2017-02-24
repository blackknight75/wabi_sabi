require 'rails_helper'

describe "when a visitor visits cart with items" do
  scenario "they must log in or create an account to checkout" do
    Item.create(title: "Matcha",
                        description: "Green Tea",
                        price: 100
                       )

    visit root_path

    within('.item-card:nth-child(1)') do
      click_on "Add to Cart"
    end

    click_on "View Cart"

    expect(page).to have_content("Login or Create Account to Checkout")
    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")
    expect(page).to have_content("100")
    expect(page).to_not have_content("Checkout")

    click_on "Login or Create Account to Checkout"

    expect(current_path).to eq new_user_path

    fill_in "login[username]", with "Sally"
    fill_in "login[email]", with "Sally@email.com"
    fill_in "login[address]", with "123 2nd St"
    fill_in "login[password]", with "pass"
    fill_in "login[password_confimation]", with "pass"

    click_on "Save New Account"
    visit cart_path

    expect(page).to have_content("Login or Create Account to Checkout")
    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")
    expect(page).to have_content("100")
    expect(page).to have_content("Checkout")
  end

  scenario 'when user logs out they see login button'
    User.create(username: "sally", email: "sally@email.com", password: "pass")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit cart_path

    expect(page).to have_content("Logout")

    click_on "Logout"

    expect(page).to have_content("Login")
    expect(page).to_not have_content("Logout")
end
