class AddFieldToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :event_type, :integer, default: 0
    add_column :notifications, :event_id, :integer
  end
end
