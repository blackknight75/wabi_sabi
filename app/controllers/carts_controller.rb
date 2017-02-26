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
    @items = Cart.cart_contents(@cart.contents)
  end

  def destroy
    @cart.contents.delete(params[:item_id])
    item = Item.find(params[:item_id])
    # flash[:link_notice] = "Successfully removed <a href="/jobs/list?job=#{item.title}" from your cart."
    flash[:notice] = "Successfully removes #{view_context.link_to("#{item.title}", "/items/#{item.id}")} from cart."
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  def update
    @cart.update_quantity(params[:item_id], params[:Quantity])
    session[:cart] = @cart.contents
    redirect_to cart_path
  end


end
