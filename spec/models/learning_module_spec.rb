# == Schema Information
#
# Table name: learning_modules
#
#  id                      :integer          not null, primary key
#  created_at              :datetime
#  updated_at              :datetime
#  name                    :string(255)
#  number                  :integer
#  presentation_embed_code :text
#  program_id              :integer
#

require "rails_helper"

RSpec.describe LearningModule, type: :model do
  it { should have_many :classroom_module_presents }
  it { should have_many :classrooms_presented_to }
  it { should belong_to :program }

  it { should validate_presence_of :name }
  it { should validate_presence_of :number }
  it { should validate_presence_of :presentation_embed_code }
  it { should validate_presence_of :program_id }

  let(:learning_module) { create :learning_module }
  let(:classroom) { create :classroom }
  describe "#present_to!" do
    it "adds classroom to classrooms_presented_to" do
      expect { learning_module.present_to! classroom }
        .to change { learning_module.classrooms_presented_to.count }.by 1
    end

    it "adds module to classsroom's presented modules" do
      expect { learning_module.present_to! classroom }
        .to change { classroom.presented_learning_modules.count }.by 1
    end
  end

  describe "#presented_to?" do
    it "returns false if module not presented to classroom" do
      expect(learning_module.presented_to? classroom).to be false
    end

    it "returns true if module presented to classroom" do
      learning_module.present_to! classroom
      expect(learning_module.presented_to? classroom).to be true
    end
  end
end
