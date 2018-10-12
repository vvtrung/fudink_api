class Api::CartsController < ApplicationController
  before_action :authenticate!
  before_action :load_carts, only: :index
  before_action :load_item, only: %i(update destroy)

  def index
    json_response_pagination parse_json(@carts), params[:page] ||= 1, params[:per_page],
      @carts.total_pages, @carts.total_entries
  end

  def create
    if is_exists?
      update_quantity
    else
      @item = @current_user.carts.create! cart_params
    end
    json_response parse_json(@item), I18n.t("carts.created_success")
  end

  def update
    update_quantity
    json_response parse_json(@item), I18n.t("carts.updated_success")
  end

  def destroy
    @item.destroy!
    json_response parse_json(@item), I18n.t("carts.destroyed_success")
  end

  private

  def load_carts
    @carts = @current_user.carts.includes(:product, :size, :user)
      .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
  end

  def load_item
    @item = @current_user.carts.includes(:product, :size).find_by! id: params[:id]
  end

  def cart_params
    params.permit :product_id, :size_id, :quantity
  end

  def is_exists?
    @item = @current_user.carts.find_by product_id: params[:product_id], size_id: params[:size_id]
    @item.present?
  end

  def update_quantity
    @item.update! quantity: params[:quantity]
  end
end
