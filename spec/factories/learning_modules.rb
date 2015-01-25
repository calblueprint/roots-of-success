# == Schema Information
#
# Table name: learning_modules
#
#  id                      :integer          not null, primary key
#  created_at              :datetime
#  updated_at              :datetime
#  name                    :string(255)
#  number                  :integer
#  presentation_embed_code :text
#  program_id              :integer
#

FactoryGirl.define do
  factory :learning_module do
    sequence(:name) { |n| "Learning Module #{n}" }
    sequence(:number) { |n| n }
    presentation_embed_code "embed"
  end
end
