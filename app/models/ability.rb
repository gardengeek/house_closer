class Ability
  include CanCan::Ability

  class_attribute :lead_id

  def initialize(user)
    if user && user.has_role?(:admin)
      can :manage, :all
    elsif user && user.has_role?(:manager)
      can :manage, Contact
      can :manage, Lead
    else
      can :manage, Lead, :id => self.lead_id
    end
  end
end
