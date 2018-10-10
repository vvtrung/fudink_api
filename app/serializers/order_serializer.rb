class OrderSerializer < ActiveModel::Serializer
  attributes :id, :address, :phone, :ship_cost, :total, :status
  has_one :user
  has_one :store
end
