# == Schema Information
#
# Table name: teachers
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  phone                  :string(255)
#  position               :string(255)
#  location               :string(255)
#

class Teacher < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
end
