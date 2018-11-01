class Api::CartsController < ApplicationController
  before_action :authenticate!
  before_action :load_item, only: %i(update destroy)
  before_action :load_carts, only: :index
  authorize_resource

  def index
    carts_serializer = parse_json @carts
    if params[:get_all].blank?
      json_response_pagination carts_serializer, params[:page] ||= 1, params[:per_page],
        @carts.total_pages, @carts.total_entries
    else
      json_response carts_serializer
    end
  end

  def create
    if is_exists?
      @item.update! quantity: params[:quantity].to_i + @item.quantity
    else
      @item = @current_user.carts.create! cart_params
    end
    json_response parse_json(@item), I18n.t("carts.created_success")
  end

  def update
    @item.update! quantity: params[:quantity]
    json_response parse_json(@item), I18n.t("carts.updated_success")
  end

  def destroy
    @item.destroy!
    json_response parse_json(@item), I18n.t("carts.destroyed_success")
  end

  private

  def load_item
    @item = @current_user.carts.includes(:product, :size).find_by! id: params[:id]
  end

  def load_carts
    @carts = if params[:get_all].blank?
      @current_user.carts.includes(:product, :size, :customer)
        .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    else
      @current_user.carts.includes(:product, :size, :customer)
    end
  end

  def cart_params
    params.permit :product_id, :size_id, :quantity
  end

  def is_exists?
    @item = @current_user.carts.find_by product_id: params[:product_id], size_id: params[:size_id]
    @item.present?
  end
end
