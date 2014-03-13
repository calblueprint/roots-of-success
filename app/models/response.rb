# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  question_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  text        :string(255)
#  user_id     :integer
#

class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :teacher
  belongs_to :student

  def can_be_read_by?(teach)
    teach == teacher || student.teacher == teach
  end
end
