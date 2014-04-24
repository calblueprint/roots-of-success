# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

class CorrectionalFacilityTeachersSurvey < Survey
end
