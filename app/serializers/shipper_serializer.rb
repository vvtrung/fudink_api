class ShipperSerializer < ActiveModel::Serializer
  attributes :id, :identity_number, :status, :location
  has_one :user
end
