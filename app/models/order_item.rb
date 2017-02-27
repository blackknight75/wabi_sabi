class OrderItem < ActiveRecord::Base
  belongs_to :items
  belongs_to :orders
end
