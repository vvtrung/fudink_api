module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class TokenExpired < StandardError; end
  class AccessDenied < StandardError; end

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :render_authorization_error
    rescue_from ExceptionHandler::MissingToken, with: :render_authorization_error
    rescue_from ExceptionHandler::InvalidToken, with: :render_authorization_error
    rescue_from ExceptionHandler::TokenExpired, with: :render_authorization_error
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from Errors::Runtime::StandarError,
      Errors::Runtime::ActionFailed,
      Errors::Runtime::ServiceFailed,
      with: :render_runtime_error_response
    rescue_from ExceptionHandler::AccessDenied, with: :render_access_denied_error
    rescue_from CanCan::AccessDenied, with: :render_access_denied_error
  end

  protected

  def render_authorization_error error
    error_type = error.class.name.scan(/ExceptionHandler::(.*)/).flatten.first.underscore.to_sym
    response = {
      success: false,
      message: Settings.handle_error.public_send(error_type).message
      # error_code: Settings.handle_error.public_send(error_type).error_code
    }
    render json: response
  end

  def render_unprocessable_entity_response error
    render json: Errors::ActiveRecordValidation.new(error.record).to_hash
  end

  def render_404 error
    render json: Errors::ActiveRecordNotFound.new(error).to_hash
  end

  def render_runtime_error_response error
    render json: error.to_hash
  end

  def render_access_denied_error error
    error_type = error.class.name.scan(/ExceptionHandler::(.*)/).flatten.first.underscore.to_sym
    response = {
      success: false,
      message: Settings.handle_error.public_send(error_type).message
      # error_code: Settings.handle_error.public_send(error_type).error_code
    }
    render json: response
  end
end
