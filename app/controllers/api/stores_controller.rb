class Api::StoresController < ApplicationController
  before_action :authenticate!, only: :create
  authorize_resource only: :create
  before_action :load_store, only: :show
  before_action :load_foods_serializer_by_store, :load_drinks_serializer_by_store, only: :show

  def index
    stores_accepted = Store.accepted
    if params[:get_all].blank?
      stores_accepted = stores_accepted.paginate page: params[:page] ||= 1,
        per_page: params[:per_page] ||= 10
      stores_serializer = parse_json stores_accepted
      json_response_pagination stores_serializer, params[:page] ||= 1, params[:per_page],
        stores_accepted.total_pages, stores_accepted.total_entries
    else
      json_response(parse_json stores_accepted)
    end
  end

  def show
    store_serializer = parse_json @store
    hash_source = {store: store_serializer[:store], food: @foods_serializer, drink: @drinks_serializer}
    json_response hash_source
  end

  def create
    store = @current_user.stores.create! store_params
    json_response parse_json(store), Message.created_success(Store.name)
  end

  private

  def load_store
    @store = Store.find params[:id]
  end

  def store_params
    params.permit :name, :email, :phone, :address, :open_at, :close_at, :description,
      images_attributes: [:id, :link, :_destroy]
  end

  def load_foods_serializer_by_store
    foods_by_store = @store.products.food.includes(:images, :rates, :sizes, :store, :category)
      .paginate page: params[:food_page] ||= 1, per_page: params[:food_per_page] ||= 10
    @foods_serializer = json_pagination parse_json(foods_by_store), params[:food_page] ||= 1,
      params[:food_per_page], foods_by_store.total_pages, foods_by_store.total_entries
  end

  def load_drinks_serializer_by_store
    drinks_by_store = @store.products.food.includes(:images, :rates, :sizes, :store, :category)
      .paginate page: params[:drink_page] ||= 1, per_page: params[:drink_per_page] ||= 10
    @drinks_serializer = json_pagination parse_json(drinks_by_store), params[:food_page] ||= 1,
      params[:drink_per_page], drinks_by_store.total_pages, drinks_by_store.total_entries
  end
end
