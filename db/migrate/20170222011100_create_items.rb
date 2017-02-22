class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :image1
      t.string :image2
      t.string :image3      

      t.timestamps null: false
    end
  end
end
