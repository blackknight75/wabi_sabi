class Cart
attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def subtotal(item)
    contents[item.id.to_s] * item.price
  end

  def total(items)
    total = 0
    items.each do |p|
      total += subtotal(p)
    end
    total
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def update_quantity(item_id, quantity)
    contents[item_id] = quantity.to_i
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def self.cart_contents(contents)
    contents.keys.map do |item_id|
        Item.find(item_id)
    end
  end

  def cart_items
    contents.map do |k, v|
      Item.find(k).title
    end
  end

  def cart_item_prices
    contents.map do |k, v|
      Item.find(k).price
    end
  end
end
