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

class LearningModule < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true
  validates :presentation_embed_code, presence: true
end
