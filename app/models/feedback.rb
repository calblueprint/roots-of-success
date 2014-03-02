# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Feedback < ActiveRecord::Base
  has_many :questions
end
