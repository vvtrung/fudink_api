class ShipperOrder < ApplicationRecord
  belongs_to :shipper
  belongs_to :order

  validate :cant_back_status

  enum status: %i(pending shipping done)

  scope :order_by_status, -> {order status: :asc}

  def cant_back_status
    shipper_order = ShipperOrder.find_by! id: id
    return if ShipperOrder.statuses[shipper_order.status] < ShipperOrder.statuses[status]
    errors.add :status, "Can't back status"
  end
end
