class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :role, foreign_key: true
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
