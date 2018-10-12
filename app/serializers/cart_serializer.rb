class CartSerializer < ActiveModel::Serializer
  attributes :id, :quantity
  belongs_to :customer, class_name: User.name, foreign_key: :user_id
  belongs_to :product
  belongs_to :size
end
