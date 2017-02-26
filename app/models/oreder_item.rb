class OrderItem < AvtiveRecord::Base
  belongs_to :items
  belongs_to :orders
end
