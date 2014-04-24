# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  description  :text
#  phone_number :text
#  address      :text
#  user_id      :integer
#

class Profile < ActiveRecord::Base
  belongs_to :user
end
