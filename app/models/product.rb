class Product < ApplicationRecord
  belongs_to :category
  belongs_to :store
  has_many :sizes, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :detail_orders, dependent: :destroy
  has_many :images, as: :media, dependent: :destroy

  enum product_type: %i(food drink)

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :sizes, allow_destroy: true

  validates :name, presence: true, length: {
    minimum: Settings.validations.strings.min_length,
    maximum: Settings.validations.strings.max_length},
    uniqueness: {scope: :store_id, case_sensitive: false}
  validates :description, presence: true,
    length: {maximum: Settings.validations.text.max_length}
end
