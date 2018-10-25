class Api::Shippers::ShipperOrdersController < Api::Shippers::ShippersBaseController
  before_action :load_shipper_order, only: %i(show update)
  before_action :load_shipper_orders, only: :index

  def index
    shipper_order_serializer = parse_json @shipper_orders
    if params[:get_all].blank?
      json_response_pagination shipper_order_serializer, params[:page] ||= 1, params[:per_page],
        @shipper_orders.total_pages, @shipper_orders.total_entries
    else
      json_response shipper_order_serializer
    end
  end

  def show
    order_seralizer = parse_json @shipper_orders.order
    hash_source = {
      shipper_order: @shipper_order,
      order: order_seralizer[:order]
    }
    json_response hash_source
  end

  def update
    @shipper_order.update! shipper_order_params
    json_response parse_json(@shipper_order), Message.updated_success(Order.name)
  end

  private

  def shipper_order_params
    params.permit :status
  end

  def load_shipper_order
    @shipper_order = @current_user.shipper_orders.find_by! id: params[:id]
  end

  def load_shipper_orders
    @shipper_orders = if params[:get_al].blank?
      @current_user.shipper_orders.order_by_status
        .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    else
      @current_user.shipper_orders.order_by_status
    end
  end
end
