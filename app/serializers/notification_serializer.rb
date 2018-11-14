class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :content, :read, :event_type, :event_id
end
