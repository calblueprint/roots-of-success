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

  def image_url
    "Modules/Mod#{number}.png"
  end

end
