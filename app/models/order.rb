class Order < ActiveRecord::Base
has_many :orderitems
has_many :items, through: :orderitems
end
