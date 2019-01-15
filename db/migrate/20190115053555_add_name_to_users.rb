class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :name_kana, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string
    add_column :users, :deleted_user, :integer
  end
end
