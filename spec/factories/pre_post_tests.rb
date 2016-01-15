# == Schema Information
#
# Table name: pre_post_tests
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  link        :text
#

FactoryGirl.define do
  factory :pre_post_test do
    description "I am a pre/post test"
    link "some_link"
  end
end
