# == Schema Information
#
# Table name: teacher_surveys
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string
#  url         :text
#  description :text
#

FactoryGirl.define do
  factory :teacher_survey do
    sequence(:name) { |n| "Teacher Survey #{n}" }
    url "hello.pdf"
    description "Some description"
  end
end
