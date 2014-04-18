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
  def filled_in?
    to_check.all? { |attribute| !send(attribute).nil? }
  end

  def to_check
    attribute_names - %w[id teacher_id created_at updated_at]
  end

  def class_name
    self.class.name.underscore
  end
end
