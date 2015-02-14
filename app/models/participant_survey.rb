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
#  description     :text
#

class ParticipantSurvey < Survey
  def self.instance
    first
  end
end
