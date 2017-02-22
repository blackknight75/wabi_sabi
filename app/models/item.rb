class Item < ActiveRecord::Base
  has_many :item_categories
  has_many :categories, through: :item_categories
  # has_and_belongs_to_many :categories
end
