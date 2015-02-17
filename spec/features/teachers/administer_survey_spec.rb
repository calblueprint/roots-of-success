require "rails_helper"

RSpec.describe "The administer surveys page" do
  before { ParticipantSurvey.destroy_all }
  let(:teacher) { create :teacher }
  let!(:participant_survey) { create :participant_survey }
  let!(:teacher_surveys) { create_pair :teacher_survey }
  let!(:classroom) { create :classroom, teacher: teacher }

  subject { page }

  before do
    login_teacher teacher
    visit classroom_surveys_path classroom
  end

  it { should have_content participant_survey.name }

  it "shows list of teacher surveys" do
    teacher_surveys.each do |survey|
      expect(page).to have_content survey.name
    end
  end

  describe "participant survey link" do
    it "calls AdministerSurvey service object" do
      expect(AdministerSurveyToClassroom).to receive(:execute).with(classroom).and_return(true)
      find("#participant-survey").click
    end
  end
end
