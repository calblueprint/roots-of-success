# == Schema Information
#
# Table name: changelog_items
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  text       :text
#

class ChangelogItem < ActiveRecord::Base
  validates :text, presence: true
end
