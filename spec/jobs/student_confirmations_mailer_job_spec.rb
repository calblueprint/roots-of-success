require "rails_helper"

RSpec.describe StudentConfirmationsMailerJob do
  let(:classroom) { create :classroom }
  let(:student) { create :student, classroom: classroom }
  let(:students) { create_pair :student, classroom: classroom }

  describe ".perform" do
    context "without classroom" do
      it "raises a MissingClassroom exception" do
        expect { StudentConfirmationsMailerJob.new.perform students }
          .to raise_error(Exceptions::MissingClassroom)
      end
    end

    context "with one student" do
      it "sends one email" do
        expect { StudentConfirmationsMailerJob.new.perform student, classroom: classroom }
          .to change { ActionMailer::Base.deliveries.count }.by(1)
      end
    end

    context "with more than one student" do
      it "sends multiple emails" do
        expect { StudentConfirmationsMailerJob.new.perform students, classroom: classroom }
          .to change { ActionMailer::Base.deliveries.count }.by(students.length)
      end
    end
  end
end
