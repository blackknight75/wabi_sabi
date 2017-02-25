class OrdersController < ApplicationController

  def index
    @orders = Order.all
    @user = User.find(params[:user_id])
  end
end
