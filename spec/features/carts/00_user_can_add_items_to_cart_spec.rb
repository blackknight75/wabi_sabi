require 'rails_helper'

RSpec.feature 'when a visitor adds item to cart', type: :feature do
  before(:each) do
    item1 = Item.create(title: "Chopsticks",
                        description: "Wooden sticks.",
                        price: 100)
    end
    scenario 'a message is displayed' do

      visit root_path

      within all('.card-action')[0] do
        click_link "Add to Cart"
    end


      expect(page).to have_content("You have added 1 Chopsticks to cart")
    end

    scenario 'the message correctly increments' do

      visit root_path

      within all('.card-action')[0] do
        click_link "Add to Cart"
    end


      expect(page).to have_content("You have added 1 Chopsticks to cart")

      within all('.card-action')[0] do
        click_link "Add to Cart"
    end


      expect(page).to have_content("You have added 2 Chopsticks to cart")

    end

    scenario 'total number of items in cart increments' do
      visit root_path

      expect(page).to have_content("Cart: 0")

      within all('.card-action')[0] do
        click_link "Add to Cart"
    end


      expect(page).to have_content("Cart: 1")
    end
  end
