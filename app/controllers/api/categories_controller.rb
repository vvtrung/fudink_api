class Api::CategoriesController < ApplicationController
  before_action :load_category, only: :show
  before_action :load_products_serializer_by_category, only: :show

  def index
    json_response(parse_json Category.all)
  end

  def show
    hash_source = {category: @category, products: @products_serializer}
    json_response hash_source
  end

  private

  def load_category
    @category = Category.find_by! id: params[:id]
  end

  def load_products_serializer_by_category
    products_by_category = @category.products.paginate page: params[:page] ||= 1,
      per_page: params[:per_page] ||= 10
    @products_serializer = json_pagination products_by_category, params[:page], params[:per_page],
      products_by_category.total_pages, products_by_category.total_entries
  end
end
