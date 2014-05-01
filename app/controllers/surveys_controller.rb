class SurveysController < ApplicationController
  def show
    @survey = Survey.find params[:id]
  end

  def edit
    @survey = Survey.find params[:id]
  end

  def update
    @survey = Survey.find params[:id]
    if @survey # how do i grab the value from the form?
      # Handle a successful update.
      flash[:success] = 'Survey updated'
      redirect_to survey_path @survey
    else
      render "edit_survey_path @survey"
    end
  end
end
