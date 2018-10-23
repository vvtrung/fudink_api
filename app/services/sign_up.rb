class SignUp
  include Base

  def perform! params
    User.create! params
    AuthToken.generate! user
  end
end
