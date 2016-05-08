# == Schema Information
#
# Table name: supplemental_materials
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content      :text
#  classroom_id :integer          not null
#  name         :string
#  position     :integer
#

require 'rails_helper'

RSpec.describe SupplementalMaterial, type: :model do
  it { should belong_to :classroom }
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :classroom_id }
end
