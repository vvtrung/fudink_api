class Api::CategoriesController < ApplicationController
  before_action :load_category, only: :show
  before_action :load_products_by_category, only: :show

  def index
    json_response(parse_json Category.all)
  end

  def show
    hash_source = {category: @category}
    products_hash = parse_json @products
    if params[:get_all].blank?
      @products_serializer = json_pagination products_hash, params[:page] ||= 1,
        params[:per_page], @products.total_pages, @products.total_entries
      hash_source[:products] = @products_serializer[:products]
      hash_source[:pagination] = @products_serializer[:pagination]
    else
      hash_source[:products] = products_hash[:products]
    end
    json_response hash_source
  end

  private

  def load_category
    @category = Category.find_by! id: params[:id]
  end

  def load_products_by_category
    @products = if params[:get_all].blank?
      @category.products.includes(:images, :rates, :sizes, :store, :category)
        .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    else
      @category.products.includes(:images, :rates, :sizes, :store, :category)
    end
  end
end
