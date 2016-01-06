require "rails_helper"

RSpec.describe StudentSurveyMailerJob do
  let(:classroom) { create :classroom }
  let(:students) { create_pair :student, classroom: classroom }
  let(:survey) { create :participant_survey }

  describe ".perform" do
    context "with students and survey" do
      it "sends multiple emails" do
        expect { StudentSurveyMailerJob.new.perform students: students, survey: survey }
          .to change { ActionMailer::Base.deliveries.count }.by(students.length)
      end
    end
  end
end
