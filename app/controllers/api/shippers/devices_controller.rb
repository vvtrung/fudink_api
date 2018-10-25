class Api::Shippers::DevicesController < Api::Shippers::ShippersBaseController
  before_action :load_device, only: :destroy

  def create
    device = @current_user.devices.create! device_params
    json_response parse_json(device), Message.created_success(Device.name)
  end

  def destroy
    @device.destroy!
    json_response parse_json(@device), Message.destroyed_success(Device.name)
  end

  private

  def device_params
    params.permit :device_token
  end

  def load_device
    @device = @current_user.devices.find_by! device_token: params[:id]
  end
end
