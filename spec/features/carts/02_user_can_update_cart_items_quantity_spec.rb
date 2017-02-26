require 'rails_helper'

RSpec.feature 'when cart has an item in it' do
  describe 'they see my cart item with a quantity of 1' do
    scenario 'when they increase the quantity' do
      setup
      within('.item-card:nth-child(1)') do
        expect(page).to have_content(2)
      end
    end
  end

    scenario 'when they increase the quantity' do
      setup
      within('.item-card:nth-child(1)') do
        fill_in "cart[quantity]", with: 4
        click_on "Update Quantity"
        expect(page).to have_content(4)
        expect(page).to have_content("SUBTOTAL")
      end
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("CART_TOTAL")
    end

    scenario 'when they decrese the quantity' do
      setup
      within('.item-card:nth-child(1)') do
        fill_in "cart[quantity]", with: 1
        click_on "Update Quantity"
        expect(page).to have_content(1)
        expect(page).to have_content("SUBTOTAL")
      end
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("CART_TOTAL")
    end
end

def setup
  item = Item.create(title: "Matcha",
                     description: "Green Tea",
                     price: 100)
  Item.create(title: "Stuff",
                     description: "Green Stuff",
                     price: 100)
  visit root_path

  within('.item-card:nth-child(1)') do
    click_on "Add to Cart"
  end
  within('.item-card:nth-child(2)') do
    click_on "Add to Cart"
  end
  within('.item-card:nth-child(1)') do
    click_on "Add to Cart"
  end

  expect(current_path).to eq root_path

  click_on "View Cart"
  expect(current_path).to eq cart_path

end
