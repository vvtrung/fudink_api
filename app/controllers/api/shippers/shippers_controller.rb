class Api::Shippers::ShippersController < Api::Shippers::ShippersBaseController
  def update
    @current_user.update! shipper_params
    json_response parse_json(@current_user), Message.updated_success(User.name)
  end

  private

  def shipper_params
    params.permit :status, :latitude, :longitude
  end
end
