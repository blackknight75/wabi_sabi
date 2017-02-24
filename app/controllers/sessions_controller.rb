class SessionsController < ApplicationController


  def new
  end

  def create
    binding.pry
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(current_path)
    else
      flash[:danger] = "Invalid Username or Password"
      render :new
    end
  end

end
