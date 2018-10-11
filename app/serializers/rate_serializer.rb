class RateSerializer < ActiveModel::Serializer
  attributes :id, :rate, :content
  belongs_to :user
  belongs_to :product
end
