class Api::Shippers::ShippersBaseController < ApplicationController
  before_action :authenticate!
  before_action :check_permisson
  before_action :current_ability
  authorize_resource

  def check_permisson
    return if @current_user.role_id == Settings.roles.shipper
    raise ExceptionHandler::AccessDenied
  end
end
