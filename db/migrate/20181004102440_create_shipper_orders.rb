class CreateShipperOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :shipper_orders do |t|
      t.references :shipper, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
