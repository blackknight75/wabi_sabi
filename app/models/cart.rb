class Cart
attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def self.cart_contents(contents)
    contents.keys.map do |item_id|
        Item.find(item_id)
    end
  end
end
