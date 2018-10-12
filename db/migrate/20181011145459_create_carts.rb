class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :product, foreign_key: true
      t.references :size, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
