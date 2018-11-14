class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone, :address, :avatar, :shipper, :role

  def avatar
    object.image.present? ? object.image.link.url : ""
  end
end
