# == Schema Information
#
# Table name: student_profiles
#
#  id         :integer          not null, primary key
#  age        :integer
#  student_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class StudentProfile < ActiveRecord::Base
end
