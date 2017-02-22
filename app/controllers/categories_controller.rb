class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:id])
    @items = Item.where()
  end
end
