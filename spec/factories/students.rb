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

FactoryGirl.define do
  factory :student do
    sequence(:email) { |n| "student#{n}@gmail.com" }
    confirmation_token "token"
    confirmed false
    survey_administered false
    classroom
  end
end
