class DetailOrderSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price, :sub_total
  belongs_to :product
  belongs_to :size
  belongs_to :order

  def sub_total
    object.quantity * object.price
  end
end
