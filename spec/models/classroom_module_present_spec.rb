# == Schema Information
#
# Table name: classroom_module_presents
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  classroom_id       :integer
#  learning_module_id :integer
#

require 'rails_helper'

RSpec.describe ClassroomModulePresent, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
