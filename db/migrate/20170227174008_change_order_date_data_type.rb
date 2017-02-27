class ChangeOrderDateDataType < ActiveRecord::Migration
  def change
    change_column :order_items, :order_date, :datetime
  end
end
