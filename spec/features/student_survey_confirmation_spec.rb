require "rails_helper"

RSpec.describe "The student survey confirmation page" do
  before { ParticipantSurvey.destroy_all }
  let(:student) { create :student, confirmed: true, survey_administered: false }
  let!(:survey) { create :participant_survey }

  subject { page }

  context "when the wrong token is given" do
    it "shows the confirm failed page" do
      visit student_show_survey_path student, survey, confirmation_token: "some_other_token"
      expect(page).to have_content t("students.confirm_failed.heading")
    end
  end

  context "when right token is given" do
    before { visit student_show_survey_path student, survey, confirmation_token: student.confirmation_token }

    it { should have_content t("students.show_survey.heading") }
    it { should have_content survey.form_embed_code }
  end
end
