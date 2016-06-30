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
#  program_id      :integer          not null
#

FactoryGirl.define do
  factory :participant_survey do
    sequence(:name) { |n| "Participant Survey #{n}" }
    description "Some description"
    form_embed_code "Some html"
    program
  end
end
