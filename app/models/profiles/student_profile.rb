# == Schema Information
#
# Table name: student_profiles
#
#  id         :integer          not null, primary key
#  student_id :integer
#  created_at :datetime
#  updated_at :datetime
#  phone      :string(255)
#

class StudentProfile < ActiveRecord::Base
  def filled_in?
    to_check.all? { |attribute| !send(attribute).nil? }
  end

  def to_check
    attribute_names - %w[id student_id created_at updated_at]
  end

  def class_name
    self.class.name.underscore
  end
end
