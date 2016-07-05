# == Schema Information
#
# Table name: students
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime
#  updated_at                    :datetime
#  email                         :string
#  confirmation_token            :string
#  confirmed                     :boolean          default(FALSE)
#  classroom_id                  :integer
#  survey_administered           :boolean          default(FALSE)
#  fundamentals_quiz_completed   :float            default(-1.0)
#  water_quiz_completed          :float            default(-1.0)
#  waste_quiz_completed          :float            default(-1.0)
#  transportation_quiz_completed :float            default(-1.0)
#  energy_quiz_completed         :float            default(-1.0)
#  building_quiz_completed       :float            default(-1.0)
#  health_quiz_completed         :float            default(-1.0)
#  community_quiz_completed      :float            default(-1.0)
#  application_quiz_completed    :float            default(-1.0)
#  financial_quiz_completed      :float            default(-1.0)
#

class Student < ActiveRecord::Base
  belongs_to :classroom

  validates :email, presence: true, email: true
  validates :classroom_id, presence: true
  validates :fundamentals_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                          greater_than_or_equal_to: -1 }
  validates :water_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                   greater_than_or_equal_to: -1 }
  validates :waste_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                   greater_than_or_equal_to: -1 }
  validates :transportation_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                            greater_than_or_equal_to: -1 }
  validates :energy_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                    greater_than_or_equal_to: -1 }
  validates :building_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                      greater_than_or_equal_to: -1 }
  validates :health_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                    greater_than_or_equal_to: -1 }
  validates :community_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                       greater_than_or_equal_to: -1 }
  validates :application_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                         greater_than_or_equal_to: -1 }
  validates :financial_quiz_completed, numericality: { less_than_or_equal_to: 100,
                                                       greater_than_or_equal_to: -1 }

  before_save :set_confirmation_token

  scope :confirmed,               -> { where confirmed: true }
  scope :unconfirmed,             -> { where confirmed: false }
  scope :survey_administered,     -> { where survey_administered: true }
  scope :survey_not_administered, -> { where survey_administered: false }

  def to_s
    email
  end

  def confirm!
    self.confirmed = true
    save
  end

  def unconfirm!
    self.confirmed = false
    save
  end

  def toggle_survey_administered!
    self.survey_administered = !survey_administered
    save
  end

  def quiz_completed?(quiz)
    send(quiz.student_column_name) < 0
  end

  private

  def set_confirmation_token
    self.confirmation_token = SecureRandom.hex(16) unless confirmation_token
  end
end
