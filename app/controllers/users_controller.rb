class UsersController < ApplicationController

  def create
    auth_token = SignUp.perform! user_params
    json_response parse_json(auth_token), Message.account_created
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
      .merge! role_id: 4
  end
end
