class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.type == 'admin'
      can :manage, :all
    elsif user.type == 'teacher'
      can :create, :feedback
      can :manage, :classroom
    end
  end
end

# https://github.com/ryanb/cancan/wiki/defining-abilities
# ^Defining abilities
