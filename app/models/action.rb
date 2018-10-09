class Action < ApplicationRecord
  has_many :permissions, dependent: :destroy

  enum action: %i(manage read add edit remove)
end
