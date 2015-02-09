# == Schema Information
#
# Table name: classroom_module_presents
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  classroom_id       :integer
#  learning_module_id :integer
#

FactoryGirl.define do
  factory :classroom_module_present do
    classroom
    learning_module
  end
end
