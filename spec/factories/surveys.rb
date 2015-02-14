# == Schema Information
#
# Table name: surveys
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string(255)
#  form_embed_code :text
#  type            :string(255)
#  description     :text
#

FactoryGirl.define do
  factory :survey do
    sequence(:name) { |n| "Survey #{n}" }
    description "Some description"
    form_embed_code "Some html"
    type "InvalidSurvey"

    factory(:participant_survey) { type "ParticipantSurvey" }
    factory(:teacher_survey)     { type "TeacherSurvey" }
  end
end
