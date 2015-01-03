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

FactoryGirl.define do
  factory :classroom do
    sequence(:name) { |n| "Classroom #{n}" }
    teacher
    program
  end
end
