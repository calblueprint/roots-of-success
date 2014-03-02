# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  teacher_id :integer
#

class Classroom < ActiveRecord::Base
  belongs_to :teacher
  has_many :students
end
