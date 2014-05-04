class ProfilesController < ApplicationController
  def show
    @user = User.find params[:id]
    @profile = @user.profile
    @survey_link = HighschoolStudentsSurvey.instance if current_user.student?
    render "#{profile_view(@profile)}/show"
  end

  def edit
    @user = User.find params[:id]
    @profile = @user.profile
    render "#{profile_view(@profile)}/edit"
  end

  def update
    @user = User.find params[:id]
    @profile = @user.profile
    if @profile.update_attributes profile_params(@user)
      # Handle a successful update.
      flash[:success] = 'Profile updated'
      redirect_to profile_path @user
    else
      render "#{profile_view(@profile)}/edit"
    end
  end

  private

  def profile_params(user)
    @profile = @user.profile
    params.require(@profile.class_name.to_sym).permit(@profile.to_check)
  end

  def profile_view(profile)
    profile.class_name.pluralize
  end
end
