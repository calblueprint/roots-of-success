require "rails_helper"

RSpec.describe "The student confirmation page" do
  let(:student) { create :student, confirmed: false }

  context "when the right token is given" do
    it "confirms the student" do
      expect do
        visit confirm_student_path student, confirmation_token: student.confirmation_token
      end.to change { Student.confirmed.count }.by(1)
    end

    it "shows the success page" do
      visit confirm_student_path student, confirmation_token: student.confirmation_token
      expect(page).to have_content t("students.confirm.heading", student_email: student.email)
    end
  end

  context "when the wrong token is given" do
    it "does not confirm the student" do
      expect do
        visit confirm_student_path student, confirmation_token: "some_other_token"
      end.not_to change { Student.confirmed.count }
    end

    it "shows the confirm failed page" do
      visit confirm_student_path student, confirmation_token: "some_other_token"
      expect(page).to have_content t("students.confirm_failed.heading")
    end
  end
end
