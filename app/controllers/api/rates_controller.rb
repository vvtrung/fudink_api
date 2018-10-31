class Api::RatesController < ApplicationController
  before_action :authenticate!, :current_ability, only: :create
  authorize_resource only: :create

  def create
    rate = Rate.create! rate_params
    json_response parse_json(rate), Message.created_success(Rate.name)
  end

  private

  def rate_params
    params.permit :product_id, :rate, :content
  end
end
