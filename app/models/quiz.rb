# == Schema Information
#
# Table name: quizzes
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string
#  form_embed_code :text
#  description     :text
#  program_id      :integer
#

class Quiz < ActiveRecord::Base
  belongs_to :program

  validates :name, presence: true
  validates :form_embed_code, presence: true
  validates :program_id, presence: true

  def student_column_name
    name.split.first.downcase + '_quiz_completed'
  end
end
