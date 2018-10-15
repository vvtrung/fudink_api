class Action < ApplicationRecord
  has_many :permissions, dependent: :destroy
end
