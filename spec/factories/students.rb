# == Schema Information
#
# Table name: students
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  email              :string(255)
#  confirmation_token :string(255)
#  confirmed          :boolean          default(FALSE)
#  classroom_id       :integer
#

FactoryGirl.define do
  factory :student do
    sequence(:email) { |n| "student#{n}@gmail.com" }
    confirmation_token "token"
    confirmed false
    classroom
  end
end
