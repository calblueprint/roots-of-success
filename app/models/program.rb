# == Schema Information
#
# Table name: programs
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string
#  slug       :string
#

class Program < ActiveRecord::Base
  has_many :classrooms
  has_many :learning_modules
  has_many :quizzes
  has_one :participant_survey
  has_one :teacher_survey

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  def to_s
    name
  end

  def self.name_id_pairs
    select("id, name").map { |program| [program.name, program.id] }
  end
end
