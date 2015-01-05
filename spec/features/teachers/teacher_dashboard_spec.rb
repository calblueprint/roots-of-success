require "rails_helper"

RSpec.describe "The teacher dashboard" do
  let(:teacher) { create :teacher }
  let!(:classrooms) { create_pair :classroom, teacher: teacher, active: true }
  before { login_teacher teacher }

  subject { page }

  it { should have_content t("teachers.dashboard.show.heading", name: teacher.first_name) }
  it { should have_link "+", href: new_teacher_classroom_path(teacher) }

  it "displays the teacher's active classrooms" do
    classrooms.each do |classroom|
      expect(page).to have_content classroom.name
    end
  end
end
