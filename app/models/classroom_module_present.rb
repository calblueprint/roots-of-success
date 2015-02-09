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
end
