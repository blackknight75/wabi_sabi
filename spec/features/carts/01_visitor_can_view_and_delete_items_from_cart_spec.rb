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
    save_and_open_page
    within('#items:nth-child(1)') do
    click_on "Add to Cart"
    end
    # click_button "Add to Cart"
    click_on "View Cart"

    expect(current_path).to eq("/cart")

    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")

    click_on "Remove"

    expect(page).to_not have_content("Matcha")
    expect(page).to_not have_content("Green Tea")
    expect(page).to have_content("Successfully removed Matcha from your cart.")

    click_on "Matcha"
    expect(current_path).to eq(item_path(item))
  end
end
