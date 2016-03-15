# == Schema Information
#
# Table name: supplemental_materials
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content      :text
#  classroom_id :integer
#

class SupplementalMaterial < ActiveRecord::Base
  belongs_to :classroom

  validates :content, presence: true
  validates :classroom_id, presence: true
end
