class PushNotificationService
  attr_reader :message, :to, :notification_type, :options

  def initialize(message = nil, to = nil, notification_type = 'default', options = nil)
    @message = message
    @to = to
    @notification_type = notification_type
    @options = options
  end

  def deliver
    fcm = FCM.new("AAAANqaIez0:APA91bEcln3J8afYsSv5diLpcLJm67TvaYaK0duMbAtiIjPx-DHgIFu0rY6wA3yTli-_jCqGVbfmQNB7f4LLzFFdsZcfG5Q2Ycke8b5IMCJsKVYUIds1sy6vI_UxBoUSvT0eDY5jnkvm")
    message = {
      data: @message,
      notification_type: self.notification_type
    }
    registration_ids = Shipper.find(1)&.devices.pluck(:device_token)
    fcm.send(registration_ids, message) if registration_ids.present?
  end
end


