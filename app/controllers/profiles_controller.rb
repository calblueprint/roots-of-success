class ProfilesController < ApplicationController
  def show
    @profile = Profile.find params[:id]
    @user = @profile.user
  end

  def edit
    @profile = Profile.find params[:id]
  end

  def update
    @profile = Profile.find params[:id]
    if @profile.update_attributes profile_params
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:description, :address, :phone_number)
    end
end
