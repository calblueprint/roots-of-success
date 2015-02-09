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

class LearningModule < ActiveRecord::Base
  default_scope { order :number }

  has_many :classroom_module_presents
  has_many :classrooms_presented_to, through: :classroom_module_presents, source: :classroom
  belongs_to :program

  validates :name, presence: true
  validates :number, presence: true
  validates :presentation_embed_code, presence: true
  validates :program_id, presence: true

  def present_to!(classroom)
    classrooms_presented_to << classroom
  end

  def presented_to?(classroom)
    classrooms_presented_to.include? classroom
  end
end
