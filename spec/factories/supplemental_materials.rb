# == Schema Information
#
# Table name: supplemental_materials
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content      :text
#  classroom_id :integer          not null
#  name         :string
#  position     :integer
#

FactoryGirl.define do
  factory :supplemental_material do
    sequence(:name) { |n| "Supplemental material #{n}" }
    content "Some markdown content"
    classroom
  end
end
