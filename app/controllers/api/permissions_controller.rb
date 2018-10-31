class Api::PermissionsController < ApplicationController
  before_action :authenticate!
  before_action :current_ability

  def index
    permission = can? params[:action].to_sym, params[:sub_class].constantize
    json_response {permission: permission}
  end
end
