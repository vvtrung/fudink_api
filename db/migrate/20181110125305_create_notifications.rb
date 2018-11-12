class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :content
      t.boolean :read, default: false
      t.references :user

      t.timestamps
    end
  end
end
