class RemoveImageAndAddImageIdToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image
    add_column :items, :image_id, :string
  end
end
