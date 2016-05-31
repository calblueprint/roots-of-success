require "rails_helper"

RSpec.describe "The administer surveys page" do
  before { ParticipantSurvey.destroy_all }
  let(:teacher) { create :teacher }
  let!(:classroom) { create :classroom, teacher: teacher }
  let!(:participant_survey) { create :participant_survey, program: classroom.program }
  let!(:not_in_program) { create :participant_survey }
  let!(:teacher_survey) { create :teacher_survey, program: classroom.program }

  subject { page }

  before do
    login_teacher teacher
    visit classroom_surveys_path classroom
  end

  it { should have_content participant_survey.name }
  it { should have_content teacher_survey.name }
  it { should_not have_content not_in_program.name }

  describe "participant survey link" do
    it "calls AdministerSurvey service object" do
      expect(AdministerSurveyToClassroom).to(
        receive(:execute).with(classroom: classroom, survey: participant_survey).and_return(true)
      )
      find("##{dom_id participant_survey}").click
    end
  end
end
