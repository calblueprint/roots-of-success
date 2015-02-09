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

RSpec.describe ClassroomModulePresent, type: :model do
  it { should belong_to :classroom }
  it { should belong_to :learning_module }
  it { should validate_presence_of :classroom_id }
  it { should validate_presence_of :learning_module_id }
end
