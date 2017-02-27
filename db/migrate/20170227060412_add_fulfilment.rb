class AddFulfilment < ActiveRecord::Migration
  def change
    add_column :order_items, :fulfillment_date, :date
  end
end
