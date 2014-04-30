# == Schema Information
#
# Table name: student_profiles
#
#  id         :integer          not null, primary key
#  age        :integer
#  student_id :integer
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  email      :string(255)
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
