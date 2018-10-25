class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.references :user, foreign_key: true
      t.string :device_token

      t.timestamps
    end
  end
end
