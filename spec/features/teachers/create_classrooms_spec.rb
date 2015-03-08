require "rails_helper"

def default_classroom_errors(teacher)
  c = teacher.classrooms.build
  c.valid?
  c.errors.full_messages
end

RSpec.describe "Teachers" do
  let(:teacher) { create :teacher }
  let!(:program) { create :program }
  before { login_teacher teacher }

  subject { page }

  it { should have_link "+", href: new_teacher_classroom_path(teacher) }

  describe "submiting classroom create" do
    before { visit new_teacher_classroom_path teacher }

    it { should have_content t("teachers.classrooms.new.heading") }

    context "without filling in form" do
      it "does not create a classroom" do
        expect { click_button "Create" }.not_to change { Classroom.count }
      end

      it "rerenders page with errors" do
        click_button "Create"
        default_classroom_errors(teacher).each do |message|
          expect(page).to have_content message
        end
      end
    end

    context "with filled in form" do
      let(:classroom) { build :classroom }
      before do
        fill_in "Name", with: classroom.name
        fill_in "Description", with: classroom.description
        select program.name, from: "classroom_program_id"
      end

      it "creates a classroom" do
        expect { click_button "Create" }
          .to change { Classroom.count }.by(1)
      end

      it "redirects to classroom show page" do
        click_button "Create"
        expect(page).to have_content classroom.name
      end
    end
  end
end
