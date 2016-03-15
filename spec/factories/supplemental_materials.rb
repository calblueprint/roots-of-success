# == Schema Information
#
# Table name: supplemental_materials
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content      :text
#  classroom_id :integer
#

FactoryGirl.define do
  factory :supplemental_material do
    content "Some markdown content"
    classroom
  end
end
