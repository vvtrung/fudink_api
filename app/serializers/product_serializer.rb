class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_type, :description, :sum_rate, :avg_rate_score, :pictures
  belongs_to :category
  belongs_to :store
  has_many :sizes
  has_many :rates
  has_many :images

  def sum_rate
    object.rates.size
  end

  def avg_rate_score
    return 0 if sum_rate.zero?
    avg_score = object.rates.sum do |rate|
      rate.rate
    end
    avg_score / sum_rate
  end

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
end
