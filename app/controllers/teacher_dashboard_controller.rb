# Actions for the teacher dashboard
class TeacherDashboardController < ApplicationController
  authorize_resource :class => false

  def index
    @learning_modules = LearningModule.all
    @classrooms = current_user.classrooms
  end

  def surveys
    @user = current_user
    @profile = @user.profile
    @all_teachers = AllTeachersSurvey.instance
    @correctional_teacher = CorrectionalFacilityTeacherSurvey.instance
    @highschool_teacher = HighSchoolTeacherSurvey.instance
  end
end
