class ShipperOrderSerializer < ActiveModel::Serializer
  attributes :id, :status
  has_one :shipper
  has_one :order
end
