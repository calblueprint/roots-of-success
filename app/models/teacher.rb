# == Schema Information
#
# Table name: teachers
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  phone                  :string
#  position               :string
#  location               :string
#

class Teacher < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :classrooms

  validates :first_name, presence: true
  validates :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    name
  end
end
