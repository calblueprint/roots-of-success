class Ability
  include CanCan::Ability

  def initialize(user)

    alias_action :create, :read, :update, :destroy, :to => :crud
    user ||= User.new
    
    if user.type == 'Admin'
      can :manage, :all
    elsif user.type == 'Teacher'
      can :manage, Classroom, :teacher_id => user.id
      can [:create, :read], Feedback 
      can [:create, :read], Question
      can :update, Project if user.admin?
      can :read, Response { |res| res.can_be_read_by? user }
      can :read, LearningModule
      can :crud, Student
    elsif user.type == 'Student'
      can :read, :classroom
      can :read, Response, :id => user.id
    end
  end
end

# https://github.com/ryanb/cancan/wiki/defining-abilities
# ^Defining abilities
