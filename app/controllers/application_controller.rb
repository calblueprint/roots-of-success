class ApplicationController < ActionController::Base
  [HighSchoolTeacherSurvey, HighSchoolStudentSurvey,
    CorrectionalFacilityTeacherSurvey, AllTeachersSurvey] if Rails.env.development?

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include DeviseSettings
  include AuthorizationHelpers
end
