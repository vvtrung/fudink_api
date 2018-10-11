class ImageSerializer < ActiveModel::Serializer
  attributes :id, :link
  belongs_to :media
end
