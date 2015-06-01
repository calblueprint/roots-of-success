# == Schema Information
#
# Table name: teachers
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  phone                  :string
#  position               :string
#  location               :string
#

FactoryGirl.define do
  factory :teacher do
    first_name "Teacher"
    sequence(:last_name) { |n| n }
    sequence(:email) { |n| "teacher#{n}@ros.org" }
    password "password"
  end
end
