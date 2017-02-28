require 'rails_helper'

describe 'when a user visits the orders page' do
  xscenario 'they see al past orders' do
    user = User.create(username: "sally", email: "sally@email.com", password: "pass", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    user2 = User.create(username: "sally", email: "sally@email.com", password: "pass", role: 1)

    order1 = user.orders.create(order_date: 01/01/2017)
    order2 = user.orders.create(order_date: 05/01/2017)
    order3 = user2.orders.create(order_date: 04/01/2017)

    visit user_orders_path(user)

    expect(page).to have_content("Past Orders")
    expect(page).to have_content("Order #{order1.id} 01/01/2017")
    expect(page).to have_content("Order #{order2.id} 05/01/2017")
    expect(page).to_not have_content("Order #{order3.id} 04/01/2017")
  end
end
