class OrdersController < ApplicationController

  def new
    @item_names = @cart.cart_items
    @item_prices = @cart.cart_item_prices
  end

  def index
    @orders = Order.where(user_id: current_user)

  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(order_status: "Ordered", user_id: current_user.id, order_total: params[:cart_total])
    if order.save
      binding.pry
      @cart.contents.each do |item_id, quantity|
        order.order_items.create(item_id: item_id, quantity: quantity, order_date: Time.now.utc.localtime, status: "Ordered",)
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
