# == Schema Information
#
# Table name: teachers
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  first_name :string(255)
#  last_name  :string(255)
#

class Teacher < ActiveRecord::Base
end
