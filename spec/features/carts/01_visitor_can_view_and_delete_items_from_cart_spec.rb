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

    # within(first('.item-card')) do
    #   click_on "Add to Cart"
    # end

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

    expect(current_path).to eq("/cart")

    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")

    within('.item-card:nth-child(1)') do
      click_on "Remove Item"
    end
    
    expect(page).to_not have_content("Matcha")		
    expect(page).to_not have_content("Green Tea")		
    expect(page).to have_content("Successfully removed Matcha from your cart.")
    
    within('.items') do
      expect(page).to_not have_content("Matcha")
      expect(page).to_not have_content("Green Tea")
    end


    click_on "Matcha"
    expect(current_path).to eq(item_path(item))
  end
end
