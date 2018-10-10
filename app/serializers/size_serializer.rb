class SizeSerializer < ActiveModel::Serializer
  attributes :id, :size, :price
  has_one :product
end
