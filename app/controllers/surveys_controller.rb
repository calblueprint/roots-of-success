class SurveysController < ApplicationController
  def show
    @survey = Survey.find params[:id]
  end

  def edit
    @survey = Survey.find params[:id]
  end

  def update
    @survey = Survey.find params[:id]
    @survey.update_attributes survey_attributes
    flash[:success] = 'survey updated!'
    redirect_to survey_path @survey
  end

  private
    def survey_attributes
      params.require(:survey).permit(:link, :name)
    end
end
