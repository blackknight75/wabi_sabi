class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user
  helper_method :admin?

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin_authenticate
    if current_user.role == 0
      redirect_to admin_dashboard_path
    else current_user.role == 1
      redirect_to dashboard_path
    end
  end

  def admin_gate
    if current_user.role != 0
      redirect_to '/404'
    end
  end

  def admin?
    if current_user
      return true if current_user.role == 0
      return false if current_user.role != 0
    else
      return false
    end
  end
end
