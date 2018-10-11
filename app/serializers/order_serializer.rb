class OrderSerializer < ActiveModel::Serializer
  attributes :id, :address, :phone, :ship_cost, :total, :status
  belongs_to :user
  belongs_to :store
end
