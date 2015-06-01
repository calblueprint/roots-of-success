# == Schema Information
#
# Table name: participant_surveys
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string
#  form_embed_code :text
#  type            :string
#  description     :text
#

class ParticipantSurvey < ActiveRecord::Base
  validates :name, presence: true
  validates :form_embed_code, presence: true
  validates :type, presence: true

  def self.instance
    first
  end
end
