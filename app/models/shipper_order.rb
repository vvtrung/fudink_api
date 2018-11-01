class ShipperOrder < ApplicationRecord
  belongs_to :shipper
  belongs_to :order

  validate :cant_back_status, if: :id?

  enum status: %i(shipping done)

  scope :order_by_status, -> {order status: :asc}

  def cant_back_status
    return if ShipperOrder.statuses[status] == ShipperOrder.statuses[:done]
    errors.add :status, "Can't back status"
  end
end
