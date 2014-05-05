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
#  learning_module_file    :string(255)
#

class LearningModule < ActiveRecord::Base
  belongs_to :learning_module_topic
  default_scope -> { order 'number ASC' }
  mount_uploader :learning_module_file, LearningModuleFileUploader

  def image_url
    "Modules/Mod#{number}.png"
  end

  def to_s
    name
  end

  def self.names
    all.map &:name
  end
end
