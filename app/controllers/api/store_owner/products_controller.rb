class Api::StoreOwner::ProductsController < Api::StoreOwner::StoreOwnersController
  before_action :load_store
  before_action :load_product, only: %i(show update destroy)
  before_action :load_products, only: :index

  def index
    if params[:get_all].blank?
      json_response_pagination parse_json(@products), params[:page] ||= 1, params[:per_page],
        @products.total_pages, @products.total_entries
    else
      json_response(parse_json @products)
    end
  end

  def show
    json_response parse_json(@product)
  end

  def create
    product = Product.create! product_params
    json_response parse_json(product), Message.created_success(Product.name)
  end

  def update
    @product.update! product_params
    json_response parse_json(@product), Message.updated_success(Product.name)
  end

  def destroy
    @product.destroy!
    json_response parse_json(@product), Message.destroyed_success(Product.name)
  end

  private

  def product_params
    params.permit :category_id, :store_id, :name, :product_type, :description,
      images_attributes: [:id, :link, :_destroy],
      sizes_attributes: [:id, :size, :price, :_destroy]
  end

  def load_store
    @store = @current_user.stores.find_by! id: params[:store_id]
  end

  def load_product
    @product = @store.products.find_by! id: params[:id]
  end

  def load_products
    @products = if params[:get_all].blank?
      @store.products.includes(:images, :sizes)
        .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
    else
      @store.products
    end
  end
end
