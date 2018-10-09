class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.references :store, foreign_key: true
      t.string :name
      t.integer :product_type
      t.text :description

      t.timestamps
    end
  end
end
