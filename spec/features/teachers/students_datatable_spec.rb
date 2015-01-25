require "rails_helper"

RSpec.describe "The students datatable" do
  let(:teacher) { create :teacher }
  let(:classroom) { create :classroom, teacher: teacher }
  let(:confirmed_student) { create :student, classroom: classroom, confirmed: true }
  let(:unconfirmed_student) { create :student, classroom: classroom }
  let!(:students) { [unconfirmed_student, confirmed_student] }

  before do
    login_teacher teacher
    visit classroom_students_path classroom
  end

  subject { page }

  it { should have_content classroom.name }

  it "displays all the students' emails" do
    students.each do |student|
      within id_of(student) do
        expect(page).to have_content student.email
      end
    end
  end

  describe "action buttons" do
    it "only shows delete for confirmed student" do
      within id_of confirmed_student do
        expect(page).to have_css "a.delete-icon"
        expect(page).not_to have_css "a.email-icon"
      end
    end

    it "shows delete and reconfirm for unconfirmed student" do
      within id_of unconfirmed_student do
        expect(page).to have_css "a.delete-icon"
        expect(page).to have_css "a.email-icon"
      end
    end

    describe "reconfirm button", uses_jobs: true do
      it "sends an email" do
        within id_of unconfirmed_student do
          expect { find("a.email-icon").click }.to change { ActionMailer::Base.deliveries.count }.by 1
        end
      end
    end

    describe "delete button", js: true do
      it "deletes the student" do
        within id_of unconfirmed_student do
          expect { find("a.delete-icon").click }.to change { Student.count }.by -1
        end
      end
    end
  end
end
