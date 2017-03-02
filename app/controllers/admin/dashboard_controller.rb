class Admin::DashboardController < Admin::BaseController
  def index
    if params[:order_status]
      @orders = Order.where(order_status: params[:order_status])
    else
      @orders = Order.all
    end
  end
end
