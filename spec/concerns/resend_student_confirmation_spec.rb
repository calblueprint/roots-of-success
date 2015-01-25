require "rails_helper"

RSpec.describe ResendStudentConfirmation do
  let(:student) { create :student }

  describe ".execute" do
    it "create a mailed job" do
      expect(StudentConfirmationsMailerJob).to receive(:new).once.and_return null_object
      ResendStudentConfirmation.execute student
    end
  end
end
