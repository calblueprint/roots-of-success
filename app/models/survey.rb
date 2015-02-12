# == Schema Information
#
# Table name: surveys
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string(255)
#  form_embed_code :text
#

class Survey < ActiveRecord::Base
  validates :name, presence: true
  validates :form_embed_code, presence: true
end
