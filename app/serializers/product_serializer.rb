class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_type, :description, :sum_rate, :avg_rate_score, :pictures
  belongs_to :category
  belongs_to :store
  has_many :sizes
  has_many :rates

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
    pictures += object.images.each do |image|
      image.media_link.present? ? image.media_link.url : ""
    end
  end
end
