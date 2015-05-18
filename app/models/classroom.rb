# == Schema Information
#
# Table name: classrooms
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  name        :string(255)
#  teacher_id  :integer
#  program_id  :integer
#  active      :boolean          default(TRUE)
#  description :text
#  card_image  :string(255)
#

class Classroom < ActiveRecord::Base
  default_scope { order "updated_at DESC" }

  has_many :students
  has_many :classroom_module_presents
  has_many :presented_learning_modules, through: :classroom_module_presents, source: :learning_module
  belongs_to :teacher
  belongs_to :program

  validates :name, presence: true
  validates :description, presence: true
  validates :teacher_id, presence: true
  validates :program_id, presence: true

  scope :active, -> { where active: true }
  scope :inactive, -> { where active: false }

  delegate :learning_modules, to: :program

  attachment :card_image

  def to_s
    name
  end

  def transfer_to!(other_teacher)
    self.teacher = other_teacher
    save!
  end
end
