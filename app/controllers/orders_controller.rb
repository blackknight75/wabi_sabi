class OrdersController < ApplicationController

  def new
    @item_names = @cart.cart_items
    @item_prices = @cart.cart_item_prices
  end

  def create
    order = Order.new(order_date: Time.now)
    if order.save
      @cart.contents.each do |item_id, quantity|
        order.order_items.create(item_id: item_id, quantity: quantity, order_date: Time.now)
      end
        @cart.contents.clear
        session[:cart] = @cart.contents
        flash[:notice] = "Order was successfully placed #{view_context.link_to("View Order", "/orders/#{order.id}")}"
        redirect_to root_path
    else
      render order_path
    end
  end

  private

  def order_params
    params.require(:orders)
  end
end
