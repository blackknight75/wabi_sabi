class RenameImage2 < ActiveRecord::Migration
  def change
    rename_column :items, :image1, :image
  end
end
