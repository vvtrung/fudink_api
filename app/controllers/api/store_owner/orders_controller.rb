class Api::StoreOwner::OrdersController < Api::StoreOwner::StoreOwnersController
  before_action :load_store
  before_action :load_orders, only: :index
  before_action :load_order, only: %i(show update)

  def index
    if params[:get_all].blank?
      json_response_pagination parse_json(@orders), params[:page] ||= 1, params[:per_page],
        @orders.total_pages, @orders.total_entries
    else
      json_response(parse_json @orders)
    end
  end

  def show
    json_response(parse_json @order)
  end

  def update
    @order.update! order_params
    create_notification
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
    @orders = if params[:get_all].blank?
      @store.orders.lastest.includes(:customer, :detail_orders)
        .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    else
      @store.orders.lastest
    end
  end

  def load_order
    @order = @store.orders.includes(:detail_orders).find_by! id: params[:id]
  end

  def load_shippers_ready
    Shipper.online.each do |shipper|
      orders_shipping = shipper.shipper_orders.shipping
      @shippers << shipper if orders_shipping.size < Settings.max_order
    end
  end

  def send_notification
    load_shippers_ready
    @shippers.each do |shipper|
      distance = @store.distance_to([shipper.latitude, shipper.longitude], :km).floor
      next unless distance <= Settings.radius
      hash_source = {
        order_id: @order.id,
        store_name: @store.name,
        store_address: @store.address,
        store_image: @store.images.first&.link&.url,
        ship_cost: @order.ship_cost,
        # distance: Faker::Number.between(1, 5)
        distance: distance
      }
      PushNotificationService.new(hash_source, shipper).deliver
    end

  end

  def create_notification
    Notification.create! user_id: @order.customer.id, content: "Your order has been #{@order.status}",
      event_type: Notification.event_types.keys[0], event_id: @order.id
  end
end
