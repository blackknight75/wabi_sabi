require 'rails_helper'

RSpec.feature "visitor visits their cart" do
  scenario "view all items in thier cart" do
    item = Item.create(title: "Matcha",
                       description: "Green Tea",
                       price: 100)
    Item.create(title: "Stuff",
                       description: "Green Stuff",
                       price: 100)
    visit root_path



    expect(current_path).to eq root_path

    within all('.item-card').first do
      click_on "Add to Cart"
    end

      click_on "View Cart"

    expect(current_path).to eq("/cart")

    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")

    within('.item-card:nth-child(1)') do
      click_on "Remove"
    end

    within('.items')do
      expect(page).to_not have_content("Matcha")
      expect(page).to_not have_content("Green Tea")
    end

    expect(page).to have_content("Successfully removes Matcha from cart.")
      expect(page).to_not have_content("Green Tea")
    click_on "Matcha"
    expect(current_path).to eq(item_path(item))
  end
end
