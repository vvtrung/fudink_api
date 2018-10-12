class Ability
  include CanCan::Ability

  def initialize(user)
    Permission.get_by(user.role_id).each do |permission|
      can permission.action_name.to_sym, permission.sub_class.constantize
    end
  end
end
