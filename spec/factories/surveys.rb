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
  trait :survey do
    sequence(:name) { |n| "Survey #{n}" }
    description "Some description"
    form_embed_code "Some html"
  end

  factory :participant_survey, traits: [:survey]
  factory :teacher_survey, traits: [:survey]
end
