class Api::ProductsController < ApplicationController
  before_action :load_product, only: :show
  before_action :load_products, only: :index

  def index
    products_serializer = parse_json @products
    if params[:get_all].blank?
      json_response_pagination products_serializer, params[:page] ||= 1, params[:per_page],
        @products.total_pages, @products.total_entries
    else
      json_response products_serializer
    end
  end

  def show
    json_response(parse_json @product)
  end

  private

  def load_product
    @product = Product.includes(:images, :rates, :sizes, :store, :category).find_by! id: params[:id]
  end

  def load_products
    @products = if params[:get_all].present?
      Product.all
    else
      Product.all.paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    end
  end
end
