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

class HighSchoolStudentSurvey < Survey

  def self.title
    'High School'
  end

  def self.for?(klass, classroom)
    klass == Student && classroom.program == 'High School'
  end

end
