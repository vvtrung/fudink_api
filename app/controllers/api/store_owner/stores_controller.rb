class Api::StoreOwner::StoresController < Api::StoreOwner::StoreOwnersController
  before_action :load_stores, only: :index
  before_action :load_store, only: %i(show update destroy)

  def index
    json_response_pagination parse_json(@stores), params[:page] ||= 1, params[:per_page],
      @stores.total_pages, @stores.total_entries
  end

  def show
    json_response parse_json(@store)
  end

  # def create
  #   store = @current_user.stores.create! store_params
  #   json_response parse_json(store), Message.created_success(Store.name)
  # end

  def update
    store = @store.update! store_params
    json_response parse_json(store), Message.updated_success(Store.name)
  end

  private

  def store_params
    params.permit :name, :email, :phone, :address, :open_at, :close_at, :description,
      images_attributes: [:id, :link, :_destroy]
  end

  def load_stores
    @stores = @current_user.stores.includes(:images, :store_owner)
      .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
  end

  def load_store
    @store = @current_user.stores.find_by! id: params[:id]
  end
end
