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
#

class TeacherSurvey < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
end
