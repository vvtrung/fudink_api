class Api::StoresController < ApplicationController
  before_action :load_store, only: :show

  def index
    stores_accepted = Store.accepted.paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    stores_serializer = parse_json stores_accepted
    json_pagination stores_serializer, params[:page], params[:per_page], stores_accepted.total_pages, stores_accepted.total_entries
  end

  def show
    store_serializer = parse_json @store
    json_response store_serializer
  end

  private

  def load_store
    @store = Store.find_by! id: params[:id]
  end

  def store_params
    params.permit :name, :email, :phone, :address, :open_at, :close_at, :description, :user_id
  end
end
