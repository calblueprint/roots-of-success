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
  it { should belong_to :teacher }
  it { should belong_to :program }

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :teacher_id }
  it { should validate_presence_of :program_id }

  let(:classroom) { create :classroom }
  describe "#to_s" do
    it "returns the classroom's name" do
      expect(classroom.to_s).to eql classroom.name
    end
  end
end
