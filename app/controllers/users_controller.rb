class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.first_name}"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.required(:user)
                    .permit(:username,
                            :first_name,
                            :last_name,
                            :email,
                            :address,
                            :password,
                            :password_confirmation
                            )
  end
end
