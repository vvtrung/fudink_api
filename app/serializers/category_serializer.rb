class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :picture

  def picture
    object.image.present? ? object.image.media_link.url : ""
  end
end
