class OrdersController < ApplicationController

  def new
    @order = Order.new
    @item_names = @cart.cart_items
    @item_prices = @cart.cart_item_prices
  end
end
