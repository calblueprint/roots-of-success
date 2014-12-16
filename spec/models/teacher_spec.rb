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

require 'rails_helper'

RSpec.describe Teacher, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
