class CreateFollowingArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :following_artists do |t|
      t.integer :user_id
      t.integer :artist_id

      t.timestamps
    end
  end
end
