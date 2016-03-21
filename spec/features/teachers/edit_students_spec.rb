require "rails_helper"

def submit_form
  click_button "Update Student"
end

RSpec.describe "The edit student page", uses_jobs: true do
  let(:teacher) { create :teacher }
  let!(:classroom) { create :classroom }
  let!(:student) { create :student, classroom: classroom }

  subject { page }

  before do
    login_teacher teacher
    visit edit_student_path student
  end

  it { should have_content t("teachers.classrooms.students.edit.heading", student_email: student.email) }

  context "without changing the email" do
    it "does not send an email" do
      expect { submit_form }.not_to change { ActionMailer::Base.deliveries.count }
    end
  end

  context "changing to a valid email" do
    before { fill_in "student_email", with: "sam@sam.com" }

    it "sends a confirmation email" do
      expect { submit_form }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "unconfirms the student" do
      submit_form
      expect(student.reload).not_to be_confirmed
    end
  end
end
