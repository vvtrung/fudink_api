class Api::ProductsController < ApplicationController
  before_action :load_product, only: :show

  def show
    json_response(parse_json @product)
  end

  private

  def load_product
    @product = Product.includes(:images, :rates, :sizes, :store, :category).find_by! id: params[:id]
  end
end
