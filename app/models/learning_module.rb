# == Schema Information
#
# Table name: learning_modules
#
#  id                       :integer          not null, primary key
#  created_at               :datetime
#  updated_at               :datetime
#  name                     :string(255)
#  presentation_embed_code  :text
#  learning_module_file     :string(255)
#  learning_module_topic_id :integer
#  version                  :string(255)
#

class LearningModule < ActiveRecord::Base
  default_scope -> { order 'version ASC' }

  belongs_to :learning_module_topic

  validates :name, :version, presence: true

  mount_uploader :learning_module_file, LearningModuleFileUploader

  def self.names
    all.map(&:name)
  end

  def to_s
    "#{name}: #{version}"
  end
end
