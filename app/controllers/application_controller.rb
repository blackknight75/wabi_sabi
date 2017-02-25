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
     if !current_admin?
       redirect_to dashboard_path#(current_user)
     else
       redirect_to admin_path
     end
  end

  def current_admin?
    if current_user && current_user.role == 0
      true
    else
      false
    end
  end

  # def redirect_to
  #   if !current_admin
  #     redirect_to "/404"
  #   else
  #   end
  # end

end
