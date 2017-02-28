class Admin::DashboardController < ApplicationController
  before_action :admin_gate

  def index
    if params[:order_status]
      @orders = Order.where(order_status: params[:order_status])
    else
      @orders = Order.all
    end
  end
end
