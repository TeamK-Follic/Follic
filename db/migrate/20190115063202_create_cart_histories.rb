class CreateCartHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_histories do |t|
      t.integer :history_id
      t.integer :item_id
      t.integer :price
      t.integer :amount

      t.timestamps
    end
  end
end
