class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform count, notification
    ActionCable.server.broadcast "notification_channel", counter: count, notification: notification.as_json
  end
end
