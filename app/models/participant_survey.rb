# == Schema Information
#
# Table name: participant_surveys
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string
#  form_embed_code :text
#  description     :text
#  program_id      :integer          not null
#

class ParticipantSurvey < ActiveRecord::Base
  belongs_to :program

  validates :name, presence: true
  validates :form_embed_code, presence: true
  validates :description, presence: true
  validates :program_id, presence: true
end
