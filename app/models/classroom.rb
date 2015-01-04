# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  teacher_id  :integer
#  program_id  :integer
#  active      :boolean          default(TRUE)
#  description :text
#

class Classroom < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :program

  validates :name, presence: true
  validates :description, presence: true
  validates :teacher_id, presence: true
  validates :program_id, presence: true

  scope :active, -> { where active: true }
  scope :inactive, -> { where active: false }
end
