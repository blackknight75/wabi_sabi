class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.Save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:notice] = "Logged in as #{@user.username}"
    else
      render :new
    end
  end


  private

  def user_params
    params.required(:user).permit(:username, :first_name, :last_name, :email, :address, :password, :password_confirmation)
  end
end
