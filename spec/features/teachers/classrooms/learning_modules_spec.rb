require "rails_helper"


RSpec.describe "Learning modules" do
  def i(key)
    t "teachers.classrooms.learning_modules#{key}"
  end

  let(:teacher) { create :teacher }
  let(:classroom) { create :classroom, teacher: teacher }
  let(:learning_module1) { create :learning_module, program: classroom.program }
  let(:learning_module2) { create :learning_module, program: classroom.program }
  let!(:learning_modules) { [learning_module1, learning_module2] }

  before { login_teacher teacher }

  subject { page }

  describe "index page" do
    before { visit classroom_learning_modules_path classroom }
    it "lists the learning modules" do
      learning_modules.each do |learning_module|
        expect(page).to have_content learning_module.name
      end
    end
  end

  describe "show" do
    before { visit classroom_learning_module_path classroom, learning_module1 }

    it { should have_content learning_module1.name }
    it { should have_content i(".show.present") }

    describe "clicking present button" do
      it "marks module as presented" do
        expect { click_link i(".show.present") }
          .to change { learning_module1.classrooms_presented_to.count }.by 1
      end
    end

    describe "clicking unpresent button" do
      before do
        learning_module1.present_to! classroom
        visit classroom_learning_module_path classroom, learning_module1
      end

      it "marks module as unpresented" do
        expect { click_link i(".show.unpresent") }
          .to change { learning_module1.classrooms_presented_to.count }.by(-1)
      end
    end
  end
end
