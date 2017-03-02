class RemoveImage3FromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image3, :string
  end
end
