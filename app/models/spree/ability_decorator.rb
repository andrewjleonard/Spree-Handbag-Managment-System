class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('hms-technical')
      can [:admin,:create], Spree::Micropost
      can [:admin, :read, :clean, :repair, :colour, :limbo, :colour_completed, :clean_completed, :repair_completed, :move_limbo], Spree::Handbag
    end
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('hms-admin')
      can :manage, [Spree::Handbag,Spree::Micropost,Spree::Admin,Spree::User] 
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)