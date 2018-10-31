class Api::PermissionsController < ApplicationController
  before_action :authenticate!
  before_action :current_ability
  before_action :check_params

  def index
    permission = can? params[:action].to_sym, params[:sub_class].constantize
    hash_source = {
      success: true,
      permission: permission
    }
    json_response hash_source
  end

  private

  def check_params
    return if params[:action].present? && params[:sub_class].present?
    render json: {success: false, message: Message.missing_params}
  end
end
