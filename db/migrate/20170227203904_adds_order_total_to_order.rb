class AddsOrderTotalToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_total, :integer

  end
end
