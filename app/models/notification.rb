class Notification < ApplicationRecord
  belongs_to :user

  after_create :send_notification

  scope :lastest, ->{order created_at: :desc}

  def send_notification
    NotificationBroadcastJob.perform_now(Notification.count, self)
  end
end
