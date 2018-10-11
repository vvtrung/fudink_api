class SizeSerializer < ActiveModel::Serializer
  attributes :id, :size, :price
  belongs_to :product
end
