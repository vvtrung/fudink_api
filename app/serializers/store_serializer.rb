class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :address, :open_at, :close_at, :description
  belongs_to :user
  has_many :images
end
