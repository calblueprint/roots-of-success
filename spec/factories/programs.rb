# == Schema Information
#
# Table name: programs
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  slug       :string(255)
#

FactoryGirl.define do
  factory :program do
    sequence(:name) { |n| "Program #{n}" }
    sequence(:slug) { |n| "program_#{n}" }
  end
end
