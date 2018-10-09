class CreateShippers < ActiveRecord::Migration[5.1]
  def change
    create_table :shippers do |t|
      t.references :user, foreign_key: true
      t.string :identity_number
      t.integer :status, default: 0
      t.string :location

      t.timestamps
    end
  end
end
