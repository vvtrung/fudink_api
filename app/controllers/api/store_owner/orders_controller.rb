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

  private

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
end
