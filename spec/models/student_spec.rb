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

require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should allow_value("sam@sam.com").for :email }
  it { should_not allow_value("sam.com").for :email }
end
