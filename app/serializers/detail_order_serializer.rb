class DetailOrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price
  has_one :product
  has_one :size
  has_one :order
end
