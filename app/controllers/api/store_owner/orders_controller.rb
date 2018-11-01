class Api::StoreOwner::OrdersController < Api::StoreOwner::StoreOwnersController
  before_action :load_store
  before_action :load_orders, only: :index
  before_action :load_order, only: %i(show update)

  def index
    json_response_pagination parse_json(@orders), params[:page] ||= 1, params[:per_page],
      @orders.total_pages, @orders.total_entries
  end

  def show
    json_response(parse_json @order)
  end

  def update
    @order.update! order_params
    send_notification if params[:status] == Order.statuses.keys[1]
    json_response parse_json(@order), Message.updated_success(Order.name)
  end

  private

  def order_params
    params.permit :status
  end

  def load_store
    @store = @current_user.stores.find_by! id: params[:store_id]
  end

  def load_orders
    @orders = @store.orders.includes(:customer, :detail_orders)
      .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
  end

  def load_order
    @order = @store.orders.includes(:detail_orders).find_by! id: params[:id]
  end

  def load_shippers_ready
    @shippers = []
    Shipper.online.each do |shipper|
      orders_shipping = shipper.shipper_orders.shipping
      @shippers << shipper if orders_shipping.size < Settings.max_order
    end
  end

  def send_notification
    load_shippers_ready
    @shippers.each do |shipper|
      distance = @store.distance_to([shipper.latitude, shipper.longitude], :km)
      next if distance <= Settings.radius
      hash_source = {
        order_id: @order.id,
        store_name: @store.name,
        store_address: @store.address,
        ship_cost: @order.ship_cost,
        distance: distance
      }
      PushNotificationService.new(hash_source, shipper).deliver
    end
  end
end
