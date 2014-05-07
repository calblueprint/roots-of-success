# == Schema Information
#
# Table name: student_profiles
#
#  id                :integer          not null, primary key
#  student_id        :integer
#  created_at        :datetime
#  updated_at        :datetime
#  phone             :string(255)
#  surveys_completed :text
#

class StudentProfile < ActiveRecord::Base
  validates :student_id, presence: true

  serialize :surveys_completed

  def filled_in?
    to_check.all? { |attribute| send(attribute) }
  end

  def to_check
    attribute_names - %w(id student_id created_at updated_at surveys_completed)
  end

  def class_name
    self.class.name.underscore
  end

  def toggle_survey_complete!(name)
    surveys_completed[name] = !surveys_completed[name]
    save!
  end
end
