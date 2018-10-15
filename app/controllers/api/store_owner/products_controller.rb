class Api::StoreOwner::ProductsController < Api::StoreOwner::StoreOwnersController
  before_acion :load_store, only: %i(create update destroy)
  before_acion :load_product, only: %i(update destroy)

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
end
