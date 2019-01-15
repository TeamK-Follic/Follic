class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image
      t.integer :type_id
      t.integer :artist_id
      t.integer :genre_id
      t.integer :label_id
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
