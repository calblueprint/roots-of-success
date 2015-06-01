# == Schema Information
#
# Table name: participant_surveys
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string
#  form_embed_code :text
#  description     :text
#

require 'rails_helper'

RSpec.describe ParticipantSurvey, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :form_embed_code }
end
