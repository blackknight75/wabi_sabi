require 'rails_helper'

  RSpec.feature "an existing user has multiple orders" do
    context "as an authenticated user" do
      scenario "I see only my orders" do

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(logged_user)
        item1 = Item.create(matcha)
        item2 = Item.create(chopsticks)
        item3 = Item.create(fish)

        Cart.new(item1.id.to_s => 1)
        Cart.new(item2.id.to_s => 1)
        Cart.new(item3.id.to_s => 1)

        visit user_orders_path(logged_user.id)
          expect(page).to have_content("All Orders for Billy")
        end
      end
    end

def logged_user
  User.create(first_name: "Billy",
           last_name: "Goat",
           username: "billygoat",
           password: "pass",
           address: "123 Any St, Denver, CO 80202",
           email: "billygoat@gmail.com"
          )
end

def matcha
  {title: "Macha",
  description: "Green Tea",
  price: 100}
end

def chopsticks
    {title: "Chopsticks",
    description: "Lovely wooden chopsticks.",
    price: 5}
end

  def fish
    {title: "Fish",
    description: "slimey fish",
    price: 5}
  end
# Background: An existing user that has multiple orders
# As an Authenticated User
# When I visit "/orders"
# Then I should see all orders belonging to me and no other orders
