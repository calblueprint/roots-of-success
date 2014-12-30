# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.is_a? Teacher
      can :manage, :teacher_dashboard
      can [:edit, :update], Teacher, id: user.id
      can :manage, Classroom, teacher_id: user.id
    end
  end
end
