class Order < ActiveRecord::Base
has_many :order_items
has_many :items, through: :order_items

def item_extractor(id)
  @Item.find(id)
end

end
