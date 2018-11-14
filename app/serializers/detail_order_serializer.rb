class DetailOrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price, :sub_total, :product, :size, :images
  belongs_to :product
  belongs_to :size
  belongs_to :order

  def sub_total
    object.quantity * object.price
  end

  def images
    pictures = []
    object.product.images.each do |image|
      next unless image.link.url
      pictures << (image_name image.link.url)
    end
    pictures
  end

  def image_name image
    img_name = image.split("/")[5]
    img_name&.start_with?("http") ? image.gsub(/\/uploads\/image\/link\/(\d)*\//, "").gsub("%3A", ":/") : "https://fudink.herokuapp.com#{image}"
  end
end
