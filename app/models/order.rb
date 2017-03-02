class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def item_names
     order_items.joins(:item).pluck(:title)
  end

  def item_prices
    order_items.joins(:item).pluck(:price)
  end

  def item_quantities
    order_items.pluck(:quantity)
  end

  def subtotal(index)
    (item_prices[index] * item_quantities[index])
  end
end
