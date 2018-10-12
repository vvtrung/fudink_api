class Action < ApplicationRecord
  has_many :permissions, dependent: :destroy

  delegate :name, to: :permission, allow_nil: true
end
