class Rate < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :content, presence: true, length: {
    maximum: Settings.validations.strings.max_length}
  validates :rate, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
