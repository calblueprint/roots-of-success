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
#

FactoryGirl.define do
  factory :teacher do
    first_name "Teacher"
    sequence(:last_name) { |n| n }
    sequence(:email) { |n| "teacher#{n}@ros.org" }
    password "password"
  end
end
