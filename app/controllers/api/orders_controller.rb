class Api::OrdersController < ApplicationController
  before_action :authenticate!
  before_action :current_ability
  before_action :load_carts, only: :create
  before_action :load_orders, only: :index
  authorize_resource

  def index
    orders_serializer = parse_json @orders
    if params[:get_all].blank?
      json_response_pagination orders_serializer, params[:page] ||= 1, params[:per_page],
        @orders.total_pages, @orders.total_entries
    else
      json_response orders_serializer
    end
  end

  def create
    Order.transaction do
      @products_cart.each do |store, products|
        ship_cost = cal_ship_cost store
        total = get_total + ship_cost
        order = @current_user.orders.create!(orders_params.merge! store_id: store.id,
          total: total, ship_cost: ship_cost)
        products.each do |product|
          cart_item = Cart.find_by! product_id: product.id
          order.detail_orders.create! product_id: product.id, size_id: cart_item.size_id,
            quantity: cart_item.quantity, price: cart_item.size.price
        end
      end
      @current_user.carts.destroy_all!
    end
    json_response parse_json(order), Message.created_success(Order.name)
  end

  private

  def orders_params
    params.permit :address, :phone
  end

  def load_carts
    @products_cart = @current_user.products_cart.group_by(&:store)
  end

  def load_orders
    @orders = if params[:get_all].blank?
      @current_user.orders.includes(:customer, :detail_orders)
    else
      @current_user.orders.includes(:customer, :detail_orders)
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
    distance.nan? ? distance : distance * Settings.ship_cost
  end

  def check_empty_Cart
    return if @current_user.carts.present?
    render json: {success: false, message: Message.cart_empty}
  end
end
