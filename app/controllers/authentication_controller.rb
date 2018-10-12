class AuthenticationController < ApplicationController
  before_action :authenticate!, only: :logout

  def login
    auth_token = AuthenticateUser.new(auth_params).perform!
    json_response parse_json(auth_token), Message.logged_in
  end

  def logout
    token = AuthToken.find_by token: request.headers['Authorization']
    token ? token.destroy : raise(ExceptionHandler::AuthenticationError)
  end

  def refresh_token
    token = AuthToken.find_by refresh_token: refresh_token_param[:refresh_token]
    token ? token.renew! : raise(ExceptionHandler::AuthenticationError)
    json_response(parse_json token)
  end

  private

  def auth_params
    params.permit :email, :password
  end

  def refresh_token_param
    params.permit :refresh_token
  end
end
