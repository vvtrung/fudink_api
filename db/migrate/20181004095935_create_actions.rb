class CreateActions < ActiveRecord::Migration[5.1]
  def change
    create_table :actions do |t|
      t.integer :action, default: 0

      t.timestamps
    end
  end
end
