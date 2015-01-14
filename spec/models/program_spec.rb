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

  let!(:program1) { create :program }
  let!(:program2) { create :program }

  describe "#to_s" do
    it "returns the program name" do
      expect(program1.to_s).to eql program1.name
    end
  end

  describe ".name_id_pairs" do
    it "returns an array of pairs with each program's name and id" do
      name_id_pairs = Program.name_id_pairs
      expect(name_id_pairs).to include [program1.name, program1.id]
      expect(name_id_pairs).to include [program2.name, program2.id]
    end
  end
end
