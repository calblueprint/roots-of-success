require "rails_helper"

RSpec.describe "Learning modules" do
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
  end
end
