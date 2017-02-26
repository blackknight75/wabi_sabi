class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :orderitems
  has_many :orders, through: :orderitems

end
