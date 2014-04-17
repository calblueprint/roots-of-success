class ProfilesController < ApplicationController
  
  def show
    @profile = current_user.profile
    @user = current_user
    render "#{profile_view(@profile)}/show"
  end

  def edit
    @profile = current_user.profile
    render "#{profile_view(@profile)}/edit"
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes profile_params
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @profile
    else
      render "#{profile_view(@profile)}/edit"
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:description, :address, :phone_number)
    end

    def profile_view(profile)
      profile.class.name.underscore.pluralize
    end
end
