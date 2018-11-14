class Api::Shippers::DevicesController < Api::Shippers::ShippersBaseController
  before_action :load_device, only: :destroy

  def create
    device = @current_user.devices.find_or_initialize_by device_token: params[:device_token]
    device.save! if device.id.blank?
    @current_user.shipper.update! status: :online
    json_response parse_json(device), Message.created_success(Device.name)
  end

  def destroy
    @device.destroy!
    @current_user.shipper.update! status: :offline
    json_response parse_json(@device), Message.destroyed_success(Device.name)
  end

  private

  def load_device
    @device = @current_user.devices.find_by! device_token: params[:id]
  end
end
