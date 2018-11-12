class ShipperOrder < ApplicationRecord
  belongs_to :shipper
  belongs_to :order

  enum status: %i(shipping done)

  scope :order_by_status, -> {order status: :asc}
end
