class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are Logged in as #{@user.first_name}"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.required(:user).permit(:username, :first_name, :last_name, :email, :address, :password, :password_confirmation)
  end
end
