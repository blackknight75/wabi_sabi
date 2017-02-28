require 'rails_helper'

 RSpec.feature 'when cart has an item in it' do
   describe 'they see my cart item with a quantity of 1' do
     scenario 'when they increase the quantity' do
       setup
       visit root_path
  within all('.card-action')[0] do
    click_on "Add to Cart"
  end
  within all('.card-action')[1] do
    click_on "Add to Cart"
  end
  within all('.card-action')[0] do
    click_on "Add to Cart"
  end
      expect(current_path).to eq root_path
      within(".nav-wrapper") do
       click_on "Cart"
      end
       expect(current_path).to eq cart_path
       within('.cart-item:nth-child(1)') do
         expect(page).to have_content(2)
       end
     end
   end

   scenario 'when they increase the quantity' do
     setup

     visit root_path

     within all('.card-action')[0] do
       click_link "Add to Cart"
     end

   within all('.card-action')[1] do
     click_link "Add to Cart"
   end

     within all('.card-action')[0] do
       click_link "Add to Cart"
   end


    expect(current_path).to eq root_path

    within(".nav-wrapper") do
      click_on "Cart"
    end

     expect(current_path).to eq cart_path

     within all('.quantity')[0] do
       fill_in "Quantity", with: 4
       click_on "Update Quantity"
     end

     expect(page).to have_content("4")
     expect(page).to have_content(400)
     expect(current_path).to eq(cart_path)
     expect(page).to have_content("405")
   end

   scenario 'when they decrese the quantity' do
     setup
     visit root_path

     within all('.card-action')[0] do
       click_link "Add to Cart"
   end

   within all('.card-action')[1] do
     click_link "Add to Cart"
   end

     within all('.card-action')[0] do
       click_link "Add to Cart"
   end


    expect(current_path).to eq root_path

    within(".nav-wrapper") do
     click_on "Cart"
    end

     expect(current_path).to eq cart_path

     within all('.quantity')[0] do
       fill_in "Quantity", with: 1
       click_on "Update Quantity"
     end
       expect(page).to have_content(1)
       expect(page).to have_content(100)
     expect(current_path).to eq(cart_path)
     expect(page).to have_content("105")
   end
 end

 def setup
   item = Item.create(title: "Matcha",
                      description: "Green Tea",
                      price: 100)
   Item.create(title: "Stuff",
                      description: "Green Stuff",
                      price: 100)

 end
