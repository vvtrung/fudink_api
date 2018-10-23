class SignUp
  include Base

  def perform! params
    user = User.create! params
    AuthToken.generate! user
  end
end
