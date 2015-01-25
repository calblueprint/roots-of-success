require "rails_helper"

RSpec.describe CreateStudents do
  let(:classroom) { create :classroom }
  let(:emails) { %w(sam@sam.com hello@hello.com) }

  describe ".execute" do
    context "without classroom" do
      it "raises a MissingClassroom exception" do
        expect { CreateStudents.execute emails }.to raise_error(Exceptions::MissingClassroom)
      end
    end

    context "with classroom" do
      it "creates mailer job" do
        expect(StudentConfirmationsMailerJob).to receive(:new).once.and_return null_object
        CreateStudents.execute emails, classroom: classroom
      end
    end
  end
end
