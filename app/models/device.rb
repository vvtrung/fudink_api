class Device < ApplicationRecord
  belongs_to :user

  validates :device_toke, presence: true,
    length: {maximum: Settings.validations.strings.max_length}
end
