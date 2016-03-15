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
#

class SupplementalMaterial < ActiveRecord::Base
  belongs_to :classroom

  validates :name, presence: true
  validates :content, presence: true
  validates :classroom_id, presence: true
end
