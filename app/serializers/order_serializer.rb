class OrderSerializer < ActiveModel::Serializer
  attributes :id, :address, :phone, :ship_cost, :total, :status
  belongs_to :customer, class_name: User.name, foreign_key: :user_id
  belongs_to :store
  has_many :detail_orders
end
