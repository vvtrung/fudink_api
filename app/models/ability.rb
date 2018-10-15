class Ability
  include CanCan::Ability

  def initialize(user)
    Permission.includes(:action).get_by(user.role_id).each do |permission|
      can permission.action.name.to_sym, permission.sub_class.constantize
    end
  end
end
