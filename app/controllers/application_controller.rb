class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_authenticate
    if current_user.role == 0
      redirect_to admin_dashboard_path
    elsif current_user.role == 1
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def admin_gate
    if current_user.role != 0
      redirect_to '/404'
    end
  end
end
