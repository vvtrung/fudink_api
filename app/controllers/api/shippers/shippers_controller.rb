class Api::Shippers::ShippersController < Api::Shippers::ShippersBaseController
  def show
    render json: {success: true, status: @current_user&.shipper&.status}
  end

  def update
    @current_user.shipper.update! shipper_params
    json_response parse_json(@current_user), Message.updated_success(User.name)
  end

  private

  def shipper_params
    params.permit :status, :latitude, :longitude
  end
end
