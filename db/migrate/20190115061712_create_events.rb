class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :artist_id
      t.string :detail
      t.datetime :datetime

      t.timestamps
    end
  end
end
