class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :item, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :quantity
      t.string :status
      t.date :order_date
    end
  end
end
