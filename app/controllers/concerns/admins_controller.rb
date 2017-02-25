class AdminsController < ApplicationController

  def new
    @admin = User.new
  end

  def show
    @admin = User.find(params[:id])
  end

  def create
    @admin = User.find(params[:id])
    @admin.update_attributes(role: 0)
    if @admin.save
      redirect_to admins_path
    else
      render :new
    end
  end

  def create
    @admin = User.new(admin_params)
  end

  private

  def admin_params
    params.require(:admin)
                  .permit(:name,
                          :username,
                          :email,
                          :password,
                          :password_confirmation
                         )
  end

end
