class Device < ApplicationRecord
  belongs_to :user

  validates :device_token, presence: true, uniqueness: true,
    length: {maximum: Settings.validations.strings.max_length}
end
