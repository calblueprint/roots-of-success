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

require 'rails_helper'

RSpec.describe Program, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :slug }
  it { should validate_uniqueness_of :slug }

  it { should have_many :classrooms }
end
