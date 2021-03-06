class Api::OrdersController < ApplicationController
  before_action :authenticate!
  before_action :current_ability
  before_action :check_empty_Cart, only: :create
  before_action :load_carts, only: :create
  before_action :load_orders, only: :index
  before_action :load_order, only: :show
  authorize_resource

  def index
    orders_serializer = parse_json @orders
    orders_serializer[:orders].each do |hash_order|
      hash_order[:store] = parse_json @orders.find_by(id: hash_order[:id]).store
    end
    if params[:get_all].blank?
      json_response_pagination orders_serializer, params[:page] ||= 1, params[:per_page],
        @orders.total_pages, @orders.total_entries
    else
      json_response orders_serializer
    end
  end

  def show
    hash_source = {
      order: @order,
      store: {
        latitude: @order.store&.latitude,
        longitude: @order.store&.longitude
      }
    }
    json_response hash_source
  end

  def create
    Order.transaction do
      @products_cart.each do |store, products|
        ship_cost = cal_ship_cost store
        total = ship_cost.present? ? (get_total + ship_cost) : get_total
        order = @current_user.orders.create!(orders_params.merge! store_id: store.id,
          total: total, ship_cost: ship_cost)
        create_notification store.store_owner.id, @current_user.name, order.id
        products.each do |product|
          cart_item = @current_user.carts.find_by! product_id: product.id
          order.detail_orders.create! product_id: product.id, size_id: cart_item.size_id,
            quantity: cart_item.quantity, price: cart_item.size.price
        end
      end
      @current_user.carts.destroy_all
    end
    render json: {success: true, message: Message.created_success(Order.name)}
  end

  private

  def orders_params
    params.permit :address, :phone
  end

  def load_carts
    @products_cart = @current_user.products_cart.group_by(&:store)
  end

  def load_orders
    @orders = if params[:get_all].present?
      @current_user.orders.lastest.includes(:customer, :detail_orders)
    else
      @current_user.orders.lastest.includes(:customer, :detail_orders)
        .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    end
  end

  def get_total
    total = @current_user.carts.sum do |item|
      item.quantity * item.size.price
    end
  end

  def cal_ship_cost store
    distance = store.distance_to(params[:address], :km)
    return nil if distance.nan?
    distance = distance.floor
    ship_cost = if distance <= Settings.ship_range
      distance * Settings.ship_cost_in_range
    else
      Settings.ship_range * Settings.ship_cost_in_range
        + (distance - Settings.ship_range) * Settings.ship_cost_out_range
    end
  end

  def check_empty_Cart
    return if @current_user.carts.present?
    render json: {success: false, message: Message.cart_empty}
  end

  def create_notification user_id, customer, order_id
    Notification.create! user_id: user_id, content: "You have a new order from #{customer}",
      event_type: Notification.event_types.keys[1], event_id: order_id
  end

  def load_order
    @order = Order.find_by! id: params[:id]
  end
end
