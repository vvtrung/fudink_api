class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :address, :open_at, :close_at, :description, :status
  belongs_to :store_owner, class_name: User.name, foreign_key: :user_id
  has_many :images
end
