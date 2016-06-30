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
#  Fundamentals_quiz_completed   :float            default(-1.0)
#  Water_quiz_completed          :float            default(-1.0)
#  Waste_quiz_completed          :float            default(-1.0)
#  Transportation_quiz_completed :float            default(-1.0)
#  Energy_quiz_completed         :float            default(-1.0)
#  Building_quiz_completed       :float            default(-1.0)
#  Health_quiz_completed         :float            default(-1.0)
#  Community_quiz_completed      :float            default(-1.0)
#  Application_quiz_completed    :float            default(-1.0)
#  Financial_quiz_completed      :float            default(-1.0)
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
