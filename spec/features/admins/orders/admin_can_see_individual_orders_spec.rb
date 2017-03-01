require 'rails_helper'

RSpec.feature "as an admin" do
  scenario "visit an individual order page" do
    admin = User.create(first_name: "Brandon",
                      last_name: "Dude",
                      address: "1234 St. Denver CO",
                      username: "B1",
                      password: "password",
                      role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    item1 = Item.create(title: "Matcha",
    description: "Green Tea",
    price: 100)
    item2 = Item.create(title: "Stuff",
    description: "Green Stuff",
    price: 100)
    order = Order.create(user_id: admin.id, order_total: 300, order_status: 'Paid')
    order_item1 = order.order_items.create(item_id: item1.id, quantity: 2, status: "Ordered" , fulfillment_date: Time.now, order_date: Time.now)
    order_item2 = order.order_items.create(item_id: item2.id, quantity: 1, status: "Paid", fulfillment_date: Time.now, order_date: Time.now)

    visit order_path(order)
    # save_and_open_page
    expect(page).to have_content(order.created_at.strftime("%D at %l:%M%P"))
    expect(page).to have_content(admin.first_name)
    expect(page).to have_content(admin.last_name)
    expect(page).to have_content(admin.address)

    expect(page).to have_link(item1.title, href: item_path(item1))
    expect(page).to have_content("Quantity: #{item1.order_items.first.quantity}")
    expect(page).to have_content("Price: #{item1.price}")
    expect(page).to have_content("Subtotal: #{order.subtotal(0)}")

    expect(page).to have_link(item2.title, href: item_path(item2))
    expect(page).to have_content("Quantity: #{item2.order_items.first.quantity}")
    expect(page).to have_content("Price: #{item2.price}")
    expect(page).to have_content("Subtotal: #{order.subtotal(1)}")

    expect(page).to have_content("Total: #{order.subtotal(0) + order.subtotal(1)}")
    expect(page).to have_content("Status: #{order.order_status}")

  end
end
