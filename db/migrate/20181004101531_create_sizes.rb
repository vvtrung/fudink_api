class CreateSizes < ActiveRecord::Migration[5.1]
  def change
    create_table :sizes do |t|
      t.references :product, foreign_key: true
      t.string :size
      t.float :price

      t.timestamps
    end
  end
end
