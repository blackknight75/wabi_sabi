require 'rails_helper'

RSpec.feature 'associations' do
  describe 'items' do
    it 'should have many categories' do
      item = Item.create(title: "Macha",
                  description: "Green Tea",
                  price: 100)
      category = Category.create(name: "Beverage")
      item.item_categories.create(category: category)

    end
  end
end

def setup
  item = Item.create(title: "Macha",
                     description: "Green Tea",
                     price: 100)

  b = Item.create(title: "Chopsticks",
                  description: "Lovely wooden chopsticks.",
                  price: 5)

  c = Category.create(name: "Kitchen")
  d = Category.create(name: "Beverage")
  item.item_categories.create(category: d)
end
