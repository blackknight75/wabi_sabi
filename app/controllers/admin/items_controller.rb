class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      params[:item][:category_ids].each do |category_id|
        item.item_categories.create(category_id: category_id)
      end
      flash[:errors] = "Missing fields. Please try again."
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_ids)
  end
end
