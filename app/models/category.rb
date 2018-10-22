class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_one :image, as: :media, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.validations.strings.normal_length}
end
