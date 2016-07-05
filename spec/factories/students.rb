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

FactoryGirl.define do
  factory :student do
    sequence(:email) { |n| "student#{n}@gmail.com" }
    confirmation_token "token"
    confirmed false
    survey_administered false
    classroom
  end
end
