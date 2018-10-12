class Permission < ApplicationRecord
  belongs_to :role
  belongs_to :action

  scope :get_by, ->role_id{where role_id: role_id}
end
