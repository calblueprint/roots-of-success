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
  validates :name, uniqueness: true
  validates :slug, uniqueness: true

  has_many :classrooms
end
