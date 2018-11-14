class ShipperSerializer < ActiveModel::Serializer
  attributes :id, :identity_number, :status, :location, :latitude, :longitude
  belongs_to :user
end
