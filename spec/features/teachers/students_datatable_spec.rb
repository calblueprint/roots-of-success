require "rails_helper"

RSpec.describe "The students datatable" do
  let(:teacher) { create :teacher }
  let(:classroom) { create :classroom, teacher: teacher }
  let!(:students) { create_pair :student, classroom: classroom }

  before do
    login_teacher teacher
    visit classroom_students_path classroom
  end

  subject { page }

  it { should have_content classroom.name }

  it "displays all the students' emails" do
    within "#students-table" do
      students.each do |student|
        expect(page).to have_content student.email
      end
    end
  end
end
