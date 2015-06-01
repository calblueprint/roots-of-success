# == Schema Information
#
# Table name: programs
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string
#  slug       :string
#

FactoryGirl.define do
  factory :program do
    sequence(:name) { |n| "Program #{n}" }
    sequence(:slug) { |n| "program_#{n}" }
  end
end
