# == Schema Information
#
# Table name: quizzes
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string
#  form_embed_code :text
#  description     :text
#  program_id      :integer
#

require 'rails_helper'

RSpec.describe Quiz, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
