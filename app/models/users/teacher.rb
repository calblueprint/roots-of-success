# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  type                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  classroom_id           :integer
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  forem_admin            :boolean          default(FALSE)
#  forem_state            :string(255)      default("pending_review")
#  forem_auto_subscribe   :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#

class Teacher < User
  has_one :profile, class_name: "TeacherProfile"

  has_many :classrooms
  has_many :responses

  after_create :create_profile

  delegate :location, to: :profile

  def profile_filled_in?
    profile.filled_in?
  end

  # Hack to make datatables not break
  def program
    if classrooms.empty?
      "None"
    else
      classrooms.first.program
    end
  end
end
