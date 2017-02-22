require 'rails_helper'

RSpec.feature "visiting root page" do
  describe "when a visitor visits '/items'" do
    it "they can view all items" do
      Item.create(title: "Macha",
                  description: "Green Tea",
                  price: 100,
                  image: "http://matchasource.com/wp-content/uploads/2015/01/morning_matcha_tea_matcha_source-594x415.jpg")
      Item.create(title: "Chopsticks",
                  description: "Lovely wooden chopsticks.",
                  price: 5,
                  image: "https://ae01.alicdn.com/kf/HTB1.wBMKVXXXXcwXVXXq6xXFXXXD/New-Chinese-font-b-Handmade-b-font-Bamboo-font-b-Chopsticks-b-font-Gift-Package-Drawing.jpg")
      visit root_path

      expect(page).to have_content("Macha")
      expect(page).to have_content("Green Tea")
      expect(page).to have_content(100)
      expect(page).to have_xpath("//img[contains(@src,'http://matchasource.com/wp-content/uploads/2015/01/morning_matcha_tea_matcha_source-594x415.jpg')]")
      expect(page).to have_content("Chopsticks")
      expect(page).to have_content( "Lovely wooden chopsticks.")
      expect(page).to have_content(5)
      expect(page).to have_xpath("//img[contains(@src,'https://ae01.alicdn.com/kf/HTB1.wBMKVXXXXcwXVXXq6xXFXXXD/New-Chinese-font-b-Handmade-b-font-Bamboo-font-b-Chopsticks-b-font-Gift-Package-Drawing.jpg')]")
    end
  end
end
