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
  mount_uploader :learning_module_file, LearningModuleFileUploader
end
