class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.validations.strings.normal_length}
end
