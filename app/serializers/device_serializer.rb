class DeviceSerializer < ActiveModel::Serializer
  attributes :id, :device_token
  belongs_to :user
end
