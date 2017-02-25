require 'rails_helper'

RSpec.feature "As a user if I visit an item page" do
  context "and that item has been retired" do
    scenario "I should still be able to access the item page" do
      item = Item.create(title: "Matcha",
                  description: "Green Tea",
                  price: 100)
      visit item_path(item)

      expect(page).to have_content("Matcha")
      expect(page).to have_content("Green Tea")
      expect(page).to have_content(100)
      expect(page).to_not have_content("Add to Cart")
      expect(page).to have_content("Item Retired")
    end
  end
end

# As a user if I visit an item page and that item has been retired
# Then I should still be able to access the item page
# And I should not be able to add the item to their cart
# And I should see in place of the "Add to Cart" button or link - "Item Retired"
