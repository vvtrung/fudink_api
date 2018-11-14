class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :content, :read, :user
end
