require "rails_helper"

RSpec.describe "The students datatable", js: true do
  let(:teacher) { create :teacher }
  let(:classroom) { create :classroom, teacher: teacher }
  let!(:students) { create_pair :student, classroom: classroom }

  before do
    login_teacher teacher
    visit classroom_students_path classroom
  end

  subject { page }

  it { should have_content classroom.name }
end
