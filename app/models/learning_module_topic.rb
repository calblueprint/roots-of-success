# == Schema Information
#
# Table name: learning_module_topics
#
#  id         :integer          not null, primary key
#  topic      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  number     :integer
#

class LearningModuleTopic < ActiveRecord::Base
  validates :topic, :number, presence: true
  has_many :learning_modules

  def image_url
    "Modules/Mod#{number}.png"
  end

  def to_s
    topic
  end
end
