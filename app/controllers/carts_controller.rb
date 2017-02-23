class CartsController < ApplicationController

include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You have added #{pluralize(@cart.count_of(item.id),
                      item.title)} to cart"
    redirect_to root_path
  end

  def show
    # session[:cart].each do |c|
    #   # = Item.find_by(@cart.contents[:id])
    # @item = Item.find_by(@cart.contents[:id])
  end
end
