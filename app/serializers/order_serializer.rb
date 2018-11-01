class OrderSerializer < ActiveModel::Serializer
  attributes :id, :address, :phone, :ship_cost, :total, :status, :store, :customer
  has_many :detail_orders
end
