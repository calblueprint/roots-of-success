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

# TODO: This is pretty unnecessary, since we just use a hardcoded URL
# in the view anyway.
class TeacherSurvey < ActiveRecord::Base
  validates :name, presence: true
  validates :url, presence: true
  validates :description, presence: true
end
