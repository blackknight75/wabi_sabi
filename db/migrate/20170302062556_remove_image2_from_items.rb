class RemoveImage2FromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image2, :string
  end
end
