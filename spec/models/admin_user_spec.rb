# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime
#  updated_at             :datetime
#

require "rails_helper"

RSpec.describe AdminUser, type: :model do
  let(:admin) { build :admin_user, password: nil }
  describe "#password_required?" do
    it "returns false if admin is new" do
      expect(admin.password_required?).to be false
    end
  end

  describe "on creation" do
    it "sends a password reset email" do
      expect(admin).to receive :send_reset_password_instructions
      admin.save
    end
  end

  describe "on update" do
    before { admin.save }
    it "does not send the password reset email" do
      expect(admin).not_to receive :send_reset_password_instructions
      admin.save
    end
  end
end
