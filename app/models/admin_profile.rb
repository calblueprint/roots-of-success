# == Schema Information
#
# Table name: admin_profiles
#
#  id         :integer          not null, primary key
#  position   :text
#  admin_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class AdminProfile < ActiveRecord::Base
end
