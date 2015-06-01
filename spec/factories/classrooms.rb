# == Schema Information
#
# Table name: classrooms
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  name          :string
#  teacher_id    :integer
#  program_id    :integer
#  active        :boolean          default(TRUE)
#  description   :text
#  card_image_id :string
#

FactoryGirl.define do
  factory :classroom do
    sequence(:name) { |n| "Classroom #{n}" }
    sequence(:description) { |n| "Lorem ipsum #{n}" }
    teacher
    program
  end
end
