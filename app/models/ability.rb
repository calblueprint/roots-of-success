class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud
    user ||= User.new

    if user.type == 'Admin'
      can :manage, :all
    elsif user.type == 'Teacher'
      can :manage, Classroom, :teacher_id => user.id
      can [:read, :show], LearningModule
      can :crud, Student
      can [:index, :surveys], :teacher_dashboard
    elsif user.type == 'Student'
      can :read, :classroom
      can :read, Response, :id => user.id
    end
  end
end
