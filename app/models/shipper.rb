class Shipper < ApplicationRecord
  belongs_to :user
  has_many :shipper_orders, dependent: :destroy

  validates :identity_number, presence: true, uniqueness: true,
    format: {with: Settings.validations.identity_number_regex}

  enum status: %i(off ready block)
end
