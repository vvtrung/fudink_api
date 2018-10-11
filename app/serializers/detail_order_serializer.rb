class DetailOrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price
  belongs_to :product
  belongs_to :size
  belongs_to :order
end
