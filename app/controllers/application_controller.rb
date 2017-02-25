class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user, :current_admin?

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user!
     redirect_to admin_path if current_admin?
  end

  def current_admin?
    if current_user && current_user.role == 0
      true
    else
      false
    end
  end
end
