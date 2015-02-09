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

class ClassroomModulePresent < ActiveRecord::Base
  belongs_to :classroom
  belongs_to :learning_module

  validates :classroom_id, presence: true
  validates :learning_module_id, presence: true
end
