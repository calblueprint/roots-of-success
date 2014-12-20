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
#  curriculum_version_id  :integer
#  authentication_token   :string(255)
#

FactoryGirl.define do
  factory :teacher do
    first_name "Teacher"
    sequence(:last_name) { |n| n }
    sequence(:email) { |n| "teacher#{n}@ros.org" }
    password "password"
  end
end
