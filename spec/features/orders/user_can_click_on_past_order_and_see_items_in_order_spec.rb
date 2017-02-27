require 'rails_helper'

describe 'when an authenticated user visits orders page' do
  xscenario 'they can click on a past order and see all items in order' do

    user = User.create(username: "sally", email: "sally@email.com", password: "pass")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    Item.create(matcha)
    Item.create(chopsticks)


    order = user.orders.create(order_date: "01/01/2017")
    order.orderitems.create(item1)
    order.orderitems.create(item1)
    order.orderitems.create(item1)

    visit user_orders_path(user)
    click_on ("01/01/2017")

    expect(page).to have_content("Matcha")
    expect(page).to have_content("Green Tea")
    expect(page).to have_content("Chopsticks")
    expect(page).to have_content("Lovely wooden chopsticks.")
  end
end

def matcha
  {
    title: "Macha",
    description: "Green Tea",
    price: 100
  }
end

def chopsticks
  {
    title: "Chopsticks",
    description: "Lovely wooden chopsticks.",
    price: 5
  }
end
