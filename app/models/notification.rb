class Notification < ApplicationRecord
  belongs_to :user

  after_create :send_notification

  scope :lastest, ->{order created_at: :desc}

  enum event_type: %i(of_customer of_store)

  def send_notification
    # NotificationBroadcastJob.perform_now(Notification.count, self)
    Pusher.trigger "notification_channel", "new", self.as_json
  end
end
