class Admin::DashboardController < ApplicationController
  before_action :admin_gate

  def index
    # binding.pry
    @orders = Order.all
    @ordered_orders = Order.where(order_status: "Ordered")
  end


end
