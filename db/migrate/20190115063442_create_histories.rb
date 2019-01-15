class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :payment_id
      t.integer :status_id
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
