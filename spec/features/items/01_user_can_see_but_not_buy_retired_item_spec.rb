require 'rails_helper'

RSpec.feature "As a user if I visit an item page" do
  context "and that item has been retired" do
    scenario "I should still be able to access the item page" do
      item = Item.create(title: "Matcha",
                  description: "Green Tea",
                  retired: true,
                  price: 100)

      visit item_path(item)
      expect(page).to have_content("Matcha")
      expect(page).to have_content("Green Tea")
      expect(page).to have_content(100)
      within('.stock')do
        expect(page).to_not have_content("Add to Cart")
      end
    end
  end
end
