class ShipperSerializer < ActiveModel::Serializer
  attributes :id, :identity_number, :status, :location
  belongs_to :user
end
