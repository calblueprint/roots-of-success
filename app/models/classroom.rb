# == Schema Information
#
# Table name: classrooms
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  teacher_id      :integer
#  name            :text
#  module_progress :text
#

class Classroom < ActiveRecord::Base
  serialize :module_progress, Hash
  before_create :set_module_progress

  belongs_to :teacher
  has_many :students

  delegate :email, to: :teacher, prefix: true

  def to_s
    name
  end

  def toggle_module(module_name)
    module_progress[module_name] = !module_progress[module_name]
  end

  def set_module_progress
    self.module_progress = Hash[LearningModule.names.map { |l| [l, false] }]
  end
end
