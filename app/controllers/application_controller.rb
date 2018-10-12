class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
  include SerializableResource

  attr_reader :current_user

  def authenticate!
    @current_user = AuthorizeApiRequest.new(request.headers).perform!
  end

  def current_ability
    Ability.new @current_user
  end
end
