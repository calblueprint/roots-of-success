# == Schema Information
#
# Table name: classrooms
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  teacher_id :integer
#  program_id :integer
#

require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
