class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_type, :description
  has_one :category
  has_one :store
  has_many :sizes
end
