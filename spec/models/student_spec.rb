# == Schema Information
#
# Table name: students
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  email               :string(255)
#  confirmation_token  :string(255)
#  confirmed           :boolean          default(FALSE)
#  classroom_id        :integer
#  survey_administered :boolean          default(FALSE)
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
