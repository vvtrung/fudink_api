class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :address, :open_at, :close_at, :description, :status, :pictures
  belongs_to :store_owner, class_name: User.name, foreign_key: :user_id

  def pictures
    pictures = []
    pictures += object.images.each do |image|
      image.media_link.present? ? image.media_link.url : ""
    end
  end
end
