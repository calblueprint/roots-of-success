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
#

FactoryGirl.define do
  factory :supplemental_material do
    name "I am a supplemental material"
    content "Some markdown content"
    classroom
  end
end
