class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      can :manage, :all
    elsif user.has_role?(:manager)
      can :manage, Contact
    end
  end
end
