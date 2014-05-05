# == Schema Information
#
# Table name: surveys
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#

class Survey < ActiveRecord::
  validates :name, :link, :type, presence: true
  
  def to_s
    name
  end

  def self.title
    fail NotImplementedError
  end

  def self.for(klass, classroom)
    subclasses.select { |c| c.for?(klass, classroom) }
  end

  def self.instance
    first
  end
end
