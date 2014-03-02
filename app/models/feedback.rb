class Feedback < ActiveRecord::Base
  has_many :questions
end
