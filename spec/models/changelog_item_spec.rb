# == Schema Information
#
# Table name: changelog_items
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  text       :text
#

require 'rails_helper'

RSpec.describe ChangelogItem, type: :model do
  it { should validate_presence_of :text }
end
