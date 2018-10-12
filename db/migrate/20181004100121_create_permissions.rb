class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.references :role, foreign_key: true
      t.references :action, foreign_key: true
      t.string :sub_class

      t.timestamps
    end
  end
end
