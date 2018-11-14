class AuthTokenSerializer < ActiveModel::Serializer
  attributes :id, :token, :refresh_token, :expired_at
  belongs_to :user

  def expired_at
    I18n.l object.expired_at, format: :date_time
  end
end
