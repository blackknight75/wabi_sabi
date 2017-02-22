require 'rails_helper'

describe 'visitor visits category show page' do
  scenario 'visitor sees all items for that category' do
    item1 = Item.create(title: "Chopsticks",
                        description: "Wooden sticks.",
                        price: 100)
    item2 = Item.create(title: "Macha",
                        description: "Delicous and nutricious tea.",
                        price: 100)
    item3 = Item.create(title: "CC Lemon",
                        description: "Lemon soda.",
                        price: 100)
    category1 = Category.create(name: "Beverage")
    category2 = Category.create(name: "Soda")
    category3 = Category.create(name: "Kitchen")
    category4 = Category.create(name: "Tea")

    item1.item_categories.create(category: category3)
    item2.item_categories.create(category: category1)
    item2.item_categories.create(category: category4)
    item3.item_categories.create(category: category1)
    item3.item_categories.create(category: category2)

    visit category_path(category1)
    expect(current_path).to eq('/beverage')

    expect(page).to have_content("CC Lemon")
    expect(page).to have_content("Macha")
    expect(page).not_to have_content("Chopsticks")
  end
end
