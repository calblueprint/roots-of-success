# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  teacher_id :integer
#  created_at :datetime
#  updated_at :datetime
#  name       :text
#

class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
end
