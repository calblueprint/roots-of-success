# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.is_a? Teacher
      can :manage, :teacher_dashboard
      can :update, Teacher, id: user.id
    end
  end
end
