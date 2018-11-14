class AuthenticateUser
  include Base

  attr_reader :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def perform!
    AuthToken.generate! user
  end

  private

  def user
    user = User.find_by(email: email)
    raise(ExceptionHandler::AuthenticationError, Message.account_blocked) if user.shipper&.block?
    return user if user && user.authenticate(password)
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end
end
