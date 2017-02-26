class OrdersController < ApplicationController

  def new
    @item_names = @cart.cart_items
    @item_prices = @cart.cart_item_prices
  end

  def create
    order = Order.new(order_date: Time.now)
    if order.save
      binding.pry
      Order.last.orderitems
  end
  end

  private

  def order_params
    params.require(:orders)
  end
end
