# == Schema Information
#
# Table name: students
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  email              :string(255)
#  confirmation_token :string(255)
#  confirmed          :boolean          default(FALSE)
#

class Student < ActiveRecord::Base
  validates :email, presence: true, email: true

  before_save :set_confirmation_token

  scope :confirmed, -> { where confirmed: true }
  scope :unconfirmed, -> { where confirmed: false }

  private

  def set_confirmation_token
    self.confirmation_token = SecureRandom.hex(16) unless confirmation_token
  end
end
