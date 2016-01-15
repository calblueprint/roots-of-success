# == Schema Information
#
# Table name: pre_post_tests
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  link        :text
#

require 'rails_helper'

RSpec.describe PrePostTest, type: :model do
  it { should validate_presence_of :description }
  it { should validate_presence_of :link }
end
