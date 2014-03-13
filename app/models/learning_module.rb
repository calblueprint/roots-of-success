# == Schema Information
#
# Table name: learning_modules
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  number     :integer
#

class LearningModule < ActiveRecord::Base
end
