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

require "rails_helper"

RSpec.describe LearningModule, type: :model do
  it { should have_many :classroom_module_presents }
  it { should have_many :classrooms_presented_to }
  it { should belong_to :program }

  it { should validate_presence_of :name }
  it { should validate_presence_of :number }
  it { should validate_presence_of :presentation_embed_code }
  it { should validate_presence_of :program_id }
end
