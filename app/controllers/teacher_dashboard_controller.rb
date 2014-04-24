# Actions for the teacher dashboard
class TeacherDashboardController < ApplicationController
  def index
    @learning_modules = LearningModule.all
    @classrooms = current_user.classrooms
  end
end
