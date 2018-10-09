class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :link
      t.string :media_type
      t.integer :media_id

      t.timestamps
    end
  end
end
