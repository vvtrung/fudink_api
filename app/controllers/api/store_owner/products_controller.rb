class Api::StoreOwner::ProductsController < Api::StoreOwner::StoreOwnersController
  before_action :load_store, only: %i(create update destroy)
  before_action :load_product, only: %i(update destroy)
  before_action :load_products, only: :index

  def index
    json_response_pagination parse_json(@products), params[:page] ||= 1, params[:per_page],
      @products.total_pages, @products.total_entries
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
    @store.products.find_by! id: params[:id]
  end

  def load_products
    @products = @store.products.includes(:images, :sizes)
      .paginate page: params[:page] ||= 1, per_page: params[:per_page] ||= 10
  end
end
