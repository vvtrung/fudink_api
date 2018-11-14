class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :address, :open_at, :close_at, :description, :status, :pictures
  belongs_to :store_owner, class_name: User.name, foreign_key: :user_id
  has_many :images

  def pictures
    pictures = []
    object.images.each do |image|
      next unless image.link.url
      pictures << (image_name image.link.url)
    end
    pictures
  end

  def image_name image
    img_name = image.split("/")[5]
    img_name&.start_with?("http") ? image.gsub(/\/uploads\/image\/link\/(\d)*\//, "").gsub("%3A", ":/") : "https://fudink.herokuapp.com#{image}"
  end

  def open_at
    I18n.l object.open_at, format: :short
  end

  def close_at
    I18n.l object.open_at, format: :short
  end
end
