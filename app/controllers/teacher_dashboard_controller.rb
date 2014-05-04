# Actions for the teacher dashboard
class TeacherDashboardController < ApplicationController
  def index
    @learning_modules = LearningModule.all
    @classrooms = current_user.classrooms
  end

  def surveys
    @user = current_user
    @profile = @user.profile
    @all_teachers = AllTeachersSurvey.first
    @correctional_teacher = CorrectionalFacilityTeacherSurvey.first
    @highschool_teacher = HighSchoolTeacherSurvey.first
  end
end
