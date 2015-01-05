# == Schema Information
#
# Table name: programs
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  slug       :string(255)
#

class Program < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  has_many :classrooms

  def self.name_id_pairs
    select("id, name").map { |program| [program.name, program.id] }
  end
end
