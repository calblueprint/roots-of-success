# == Schema Information
#
# Table name: pre_post_tests
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#  link        :text
#

class PrePostTest < ActiveRecord::Base
  validates :description, presence: true
  validates :link, presence: true
end
