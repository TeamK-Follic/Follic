class RemoveImageAndAddImageIdToArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :artists, :image
    add_column :artists, :image_id, :string
  end
end
