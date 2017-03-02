class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :order_items
  has_many :orders, through: :order_items

end
