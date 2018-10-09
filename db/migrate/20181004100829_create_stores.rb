class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.time :open_at
      t.time :close_at
      t.text :description
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
