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
<<<<<<< HEAD
#  learning_module_file    :string(255)
#

class LearningModule < ActiveRecord::Base
  mount_uploader :learning_module_file, LearningModuleFileUploader
=======
#

class LearningModule < ActiveRecord::Base

  def image_url
    "Modules/Mod#{number}.png"
  end

>>>>>>> master
end
