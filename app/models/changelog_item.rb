# == Schema Information
#
# Table name: changelog_items
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  text       :text
#

# Each object represents a global notification to the teachers in the system.
# The text attribute is formatted as markdown.
class ChangelogItem < ActiveRecord::Base
  default_scope { order "created_at DESC" }

  validates :text, presence: true
end
