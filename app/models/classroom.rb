# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  teacher_id :integer
#  program_id :integer
#

class Classroom < ActiveRecord::Base
  validates :name, presence: true
  validates :teacher_id, presence: true

  belongs_to :teacher
end
