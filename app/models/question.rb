# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  feedback_id :integer
#  order_index :integer
#  text        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Question < ActiveRecord::Base
  belongs_to :feedback
  has_many :responses
end
