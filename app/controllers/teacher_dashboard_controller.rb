class TeacherDashboardController < ApplicationController
  def index
  	@learning_modules = LearningModule.all
  end
end
