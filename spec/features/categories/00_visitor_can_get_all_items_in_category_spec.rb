require 'rails_helper'

RSpec.feature"Visitor /category_name" do
  scenario "they see all items in category" do
    setup
    visit "/:kitchen"

    expect(page).to have_content("Chopsticks")
  end
end

def setup
  Item.create(title: "Macha",
              description: "Green Tea",
              price: 100,
              image: "http://matchasource.com/wp-content/uploads/2015/01/morning_matcha_tea_matcha_source-594x415.jpg")
  Item.create(title: "Chopsticks",
              description: "Lovely wooden chopsticks.",
              price: 5,
              image: "https://ae01.alicdn.com/kf/HTB1.wBMKVXXXXcwXVXXq6xXFXXXD/New-Chinese-font-b-Handmade-b-font-Bamboo-font-b-Chopsticks-b-font-Gift-Package-Drawing.jpg")
  Category.create(name: "Kitchen", slug: "kitchen")
  Category.create(name: "Beverage")

end
