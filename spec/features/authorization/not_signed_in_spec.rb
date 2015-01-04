require "rails_helper"

def expect_redirect_to_home_on_visit(path)
  visit path
  expect(page).to have_content t("devise.sessions.teacher.new.heading")
end

RSpec.describe "A visitor" do
  subject { page }

  it "cannot view the teacher dashboard" do
    expect_redirect_to_home_on_visit teacher_dashboard_path
  end
end
