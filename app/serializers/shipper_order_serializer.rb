class ShipperOrderSerializer < ActiveModel::Serializer
  attributes :id, :status
  belongs_to :shipper
  belongs_to :order
end
