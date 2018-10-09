class ShipperOrder < ApplicationRecord
  belongs_to :shipper
  belongs_to :order

  enum status: %i(pedding shipping done)
end
