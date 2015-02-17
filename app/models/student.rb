# == Schema Information
#
# Table name: students
#
#  id                  :integer          not null, primary key
#  created_at          :datetime
#  updated_at          :datetime
#  email               :string(255)
#  confirmation_token  :string(255)
#  confirmed           :boolean          default(FALSE)
#  classroom_id        :integer
#  survey_administered :boolean          default(FALSE)
#

class Student < ActiveRecord::Base
  belongs_to :classroom

  validates :email, presence: true, email: true
  validates :classroom_id, presence: true

  before_save :set_confirmation_token

  scope :confirmed,               -> { where confirmed: true }
  scope :unconfirmed,             -> { where confirmed: false }
  scope :survey_administered,     -> { where survey_administered: true }
  scope :survey_not_administered, -> { where survey_administered: true }

  def to_s
    email
  end

  def confirm!
    self.confirmed = true
    save
  end

  private

  def set_confirmation_token
    self.confirmation_token = SecureRandom.hex(16) unless confirmation_token
  end
end
