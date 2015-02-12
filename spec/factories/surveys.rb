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

FactoryGirl.define do
  factory :survey do
    sequence(:name) { |n| "Survey #{n}" }
    form_embed_code "Some html"
  end
end
