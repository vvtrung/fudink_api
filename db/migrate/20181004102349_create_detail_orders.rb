class CreateDetailOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :detail_orders do |t|
      t.references :product, foreign_key: true
      t.references :size, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
