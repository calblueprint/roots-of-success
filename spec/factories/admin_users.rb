# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime
#  updated_at             :datetime
#

FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "admin#{n}@ros.org" }
    password "password"
  end
end