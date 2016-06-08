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

FactoryGirl.define do
  factory :quiz do
    sequence(:name) { |n| "Quiz #{n}" }
    form_embed_code "Some html"
    program
  end
end
