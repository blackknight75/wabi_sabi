class Admin::DashboardController < ApplicationController
  before_action :admin_gate

  def index
    @orders = Order.all
  end
end
