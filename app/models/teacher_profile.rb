# == Schema Information
#
# Table name: teacher_profiles
#
#  id          :integer          not null, primary key
#  institution :text
#  teacher_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class TeacherProfile < ActiveRecord::Base
end
