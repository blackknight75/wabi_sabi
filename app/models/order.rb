class Order < ActiveRecord::Base
has_many :order_items
has_many :items, through: :order_items

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

  def self.ordered
    where(order_status: "Ordered")
  end

  def self.paid
    where(order_status: "Paid")
  end

  def self.completed
    where(order_status: "Completed")
  end

  def self.cancelled
    where(order_status: "Cancelled")
  end
end
