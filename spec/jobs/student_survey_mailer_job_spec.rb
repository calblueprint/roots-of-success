require "rails_helper"

RSpec.describe StudentSurveyMailerJob do
  let(:classroom) { create :classroom }
  let(:students) { create_pair :student, classroom: classroom }

  describe ".perform" do
    context "without classroom" do
      it "raises a MissingClassroom exception" do
        expect { StudentSurveyMailerJob.new.perform students }
          .to raise_error(Exceptions::MissingClassroom)
      end
    end

    context "with students and classroom" do
      it "sends multiple emails" do
        expect { StudentSurveyMailerJob.new.perform students, classroom: classroom }
          .to change { ActionMailer::Base.deliveries.count }.by(students.length)
      end
    end
  end
end
