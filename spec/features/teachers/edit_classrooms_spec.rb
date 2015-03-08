require "rails_helper"

def i(key)
  t("teachers.classrooms.edit#{key}")
end

RSpec.describe "Classroom edit page" do
  let(:teacher) { create :teacher }
  let!(:program) { create :program }
  let!(:classroom) { create :classroom, teacher: teacher }
  before do
    login_teacher teacher
    visit edit_classroom_path classroom
  end

  subject { page }

  it { should have_content i(".info.heading") }

  describe "destructive actions" do
    describe "transferring owner" do
      context "with invalid email" do
        let(:bad_email) { "bad@email.com" }
        before do
          fill_in "teacher_transfer_email", with: bad_email
          find("#submit_teacher_transfer").click
        end

        it "does not change classroom's owner" do
          expect(classroom.reload.teacher).to eql teacher
        end

        it "redirects to classroom edit page" do
          expect(page).to have_content i(".info.heading")
        end
      end

      context "with valid email" do
        let(:other_teacher) { create :teacher }
        let(:email) { other_teacher.email }
        before do
          fill_in "teacher_transfer_email", with: email
          find("#submit_teacher_transfer").click
        end

        it "changes classroom's owner" do
          expect(classroom.reload.teacher).to eql other_teacher
        end

        it "redirects to teacher dashboard" do
          expect(page).to have_content t("teachers.dashboard.show.subtitle")
        end
      end
    end

    describe "deleting classroom" do
      it "deletes classroom" do
        expect { find("#delete_classroom").click }.to change { Classroom.count }.by(-1)
      end
    end
  end
end
