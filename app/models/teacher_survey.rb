# == Schema Information
#
# Table name: teacher_surveys
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string
#  url         :text
#  description :text
#  program_id  :integer          not null
#

class TeacherSurvey < ActiveRecord::Base
  belongs_to :program

  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :program_id, presence: true
end
