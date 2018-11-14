class Api::NotificationsController < ApplicationController
  before_action :authenticate!

  def index
    notifications = @current_user.notifications.lastest
    json_response parse_json(notifications)
  end

  def update
    @notification.update! read: true
    json_response parse_json(@notification)
  end

  private

  def find_notification
    @notification = @current_user.notifications.find_by! id: params[:id]
  end
end
