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

class AllTeachersSurvey < Survey
  def self.title
    'All Teachers'
  end

  def self.for?(klass, classroom)
    klass == Teacher
  end
end
