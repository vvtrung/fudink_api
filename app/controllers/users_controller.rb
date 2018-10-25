class UsersController < ApplicationController
  before_action :authenticate!, only: :update
  before_action :current_ability, only: :update
  authorize_resource only: :update

  def create
    auth_token = SignUp.perform! create_user_params
    json_response parse_json(auth_token), Message.account_created
  end

  def update
    @current_user.update! update_user_params
    json_response parse_json(@current_user), Message.updated_success(User.name)
  end

  private

  def create_user_params
    params.permit(:name, :email, :password, :password_confirmation)
      .merge! role_id: 4
  end

  def update_user_params
    params.permit :name, :phone, :address
  end
end
