class CategoriesController < ApplicationController

  def show

    @category = Category.find_by_slug(params[:slug])
    @items = @category.items unless @category.nil?
  end
end
