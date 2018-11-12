class Notification < ApplicationRecord
  belongs_to :user

  after_create :send_notification

  scope :lastest, ->{order created_at: :desc}
  enum read: {unread: 0, read: 1}

  def send_notification
    NotificationBroadcastJob.perform_now(Notification.count, self)
  end
end
