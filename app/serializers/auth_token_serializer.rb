class AuthTokenSerializer < ActiveModel::Serializer
  attributes :id, :token, :refresh_token, :expired_at
  belongs_to :user
end
