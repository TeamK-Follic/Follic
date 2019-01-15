class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :name_kana
      t.text :image
      t.text :intro

      t.timestamps
    end
  end
end
