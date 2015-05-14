# == Schema Information
#
# Table name: changelog_items
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  text       :text
#

FactoryGirl.define do
  factory :changelog_item do
    text { "Something got updated!" }
  end
end
