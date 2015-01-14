# == Schema Information
#
# Table name: teachers
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  phone                  :string(255)
#  position               :string(255)
#  location               :string(255)
#

require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should have_many :classrooms }

  let(:teacher) { create :teacher }
  describe "#to_s" do
    it "returns the teacher's full name" do
      expect(teacher.to_s).to eql "#{teacher.first_name} #{teacher.last_name}"
    end
  end
end
