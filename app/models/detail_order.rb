class DetailOrder < ApplicationRecord
  belongs_to :product
  belongs_to :size
  belongs_to :order
end
