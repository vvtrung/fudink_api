class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone, :address, :avatar

  def avatar
    object.image.present? ? object.image.media_link.url : ""
  end
end
