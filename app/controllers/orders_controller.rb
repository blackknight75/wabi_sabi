class OrdersController < ApplicationController

  def new
    @item_names = @cart.cart_items
    @item_prices = @cart.cart_item_prices
  end

  def index
    current_user.id
  end

  def create
    order = Order.new(user_id: current_user.id, order_date: Time.now)
    if order.save
      @cart.contents.each do |item_id, quantity|
        order.order_items.create(item_id: item_id, quantity: quantity, order_date: Time.now)
      end
        @cart.contents.clear
        session[:cart] = @cart.contents
        flash[:notice] = "Order was successfully placed #{view_context.link_to("View Order", order_path(order.id))}"
        redirect_to orders_path
    else
      render order_path
    end
  end

  private

  def order_params
    params.require(:orders)
  end
end
