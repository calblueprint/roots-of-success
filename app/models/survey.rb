# == Schema Information
#
# Table name: surveys
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string(255)
#  form_embed_code :text
#  type            :string(255)
#

class Survey < ActiveRecord::Base
  validates :name, presence: true
  validates :form_embed_code, presence: true
  validates :type, presence: true

  has_paper_trail
end
