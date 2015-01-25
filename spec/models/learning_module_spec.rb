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
#

require "rails_helper"

RSpec.describe LearningModule, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :number }
  it { should validate_presence_of :presentation_embed_code }
end
