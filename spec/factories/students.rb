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
#  Fundamentals_quiz_completed   :float            default(-1.0)
#  Water_quiz_completed          :float            default(-1.0)
#  Waste_quiz_completed          :float            default(-1.0)
#  Transportation_quiz_completed :float            default(-1.0)
#  Energy_quiz_completed         :float            default(-1.0)
#  Building_quiz_completed       :float            default(-1.0)
#  Health_quiz_completed         :float            default(-1.0)
#  Community_quiz_completed      :float            default(-1.0)
#  Application_quiz_completed    :float            default(-1.0)
#  Financial_quiz_completed      :float            default(-1.0)
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
