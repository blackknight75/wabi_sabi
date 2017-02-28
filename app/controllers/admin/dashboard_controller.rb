class Admin::DashboardController < ApplicationController
  before_action :admin_gate

  def index
    @orders = Order.all
    @ordered_orders = Order.where(status: "Ordered")
  end


end
