# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  teacher_id  :integer
#  program_id  :integer
#  active      :boolean          default(TRUE)
#  description :text
#

require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { should have_many :students }
  it { should have_many :classroom_module_presents }
  it { should have_many :presented_learning_modules }
  it { should belong_to :teacher }
  it { should belong_to :program }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :teacher_id }
  it { should validate_presence_of :program_id }

  let(:classroom) { create :classroom }

  describe "#learning_modules" do
    it "delegates to program" do
      expect(classroom.program).to receive(:learning_modules)
      classroom.learning_modules
    end
  end

  describe "#to_s" do
    it "returns the classroom's name" do
      expect(classroom.to_s).to eql classroom.name
    end
  end

  describe "#transfer_to!" do
    let(:other_teacher) { create :teacher }
    it "changes the classroom's teacher" do
      classroom.transfer_to! other_teacher
      expect(classroom.teacher).to eql other_teacher
    end
  end
end
