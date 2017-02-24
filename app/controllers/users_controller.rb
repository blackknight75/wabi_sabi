class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are logged in #{@user.first_name}"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :address, :password, :password_confirmation)
  end
end
