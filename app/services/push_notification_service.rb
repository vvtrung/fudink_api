class PushNotificationService
  attr_reader :message, :to, :notification_type, :options

  def initialize(message = nil, to = nil, notification_type = 'default', options = nil)
    @message = message
    @to = to
    @notification_type = notification_type
    @options = options
  end

  def deliver
    fcm = FCM.new("AAAAVQXImjM:APA91bHN_cQDaLxpC4zHPfQhoIVlQf554kfFzL84qPTo4kl3Jg3RTynLeuHfDoCWdOabe0CNO-EcY5TnWOybngwOFLU1wEwOWpkISGzrHFFobzJYfSR4SMjXraYJVpoZSrL-7Lv1d_ym")
    message = {
      data: message,
      notification_type: self.notification_type
    }
    registration_ids = @to&.devices.pluck(:device_token)
    fcm.send(registration_ids, message) if registration_ids.present?
  end
end


