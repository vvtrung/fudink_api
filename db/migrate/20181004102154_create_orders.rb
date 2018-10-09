class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.text :address
      t.string :phone
      t.float :ship_cost
      t.float :total
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
