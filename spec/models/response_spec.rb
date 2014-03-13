# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  text        :string(255)
#  user_id     :integer
#

require 'spec_helper'

describe Response do
  pending "add some examples to (or delete) #{__FILE__}"
end
