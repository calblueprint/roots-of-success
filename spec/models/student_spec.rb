# == Schema Information
#
# Table name: students
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime
#  updated_at                    :datetime
#  email                         :string
#  confirmation_token            :string
#  confirmed                     :boolean          default(FALSE)
#  classroom_id                  :integer
#  survey_administered           :boolean          default(FALSE)
#  fundamentals_quiz_completed   :float            default(-1.0)
#  water_quiz_completed          :float            default(-1.0)
#  waste_quiz_completed          :float            default(-1.0)
#  transportation_quiz_completed :float            default(-1.0)
#  energy_quiz_completed         :float            default(-1.0)
#  building_quiz_completed       :float            default(-1.0)
#  health_quiz_completed         :float            default(-1.0)
#  community_quiz_completed      :float            default(-1.0)
#  application_quiz_completed    :float            default(-1.0)
#  financial_quiz_completed      :float            default(-1.0)
#

require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to :classroom }
  it { should allow_value("sam@sam.com").for :email }
  it { should_not allow_value("sam.com").for :email }
  it { should validate_presence_of :classroom_id }

  let(:student) { create :student }
  describe "#to_s" do
    it "returns the student's email" do
      expect(student.to_s).to eql student.email
    end
  end
end
