class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(params[:slug])
    @items = @category.items unless @category.nil?
  end
end
