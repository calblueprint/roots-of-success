# == Schema Information
#
# Table name: surveys
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string(255)
#  form_embed_code :text
#

require 'rails_helper'

RSpec.describe Survey, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :form_embed_code }
end
