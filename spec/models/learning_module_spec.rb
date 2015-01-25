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
  pending "add some examples to (or delete) #{__FILE__}"
end
