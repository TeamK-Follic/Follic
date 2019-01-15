class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :email
      t.string :encrypted_password

      t.timestamps
    end
  end
end
