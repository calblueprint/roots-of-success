require "rails_helper"

def show_new_student_heading
  have_content t("teachers.students.new.heading", classroom_name: classroom.name)
end

def fill_in_emails(emails)
  fill_in "students_emails", with: emails.join("\n")
end

def submit_form
  click_button t("teachers.students.new.submit")
end

RSpec.describe "The create student page", uses_jobs: true do
  let(:teacher) { create :teacher }
  let!(:classroom) { create :classroom, teacher: teacher }

  subject { page }

  before do
    login_teacher teacher
    visit new_classroom_student_path classroom
  end

  it { should show_new_student_heading }

  context "with valid emails filled in" do
    let(:valid_emails) { %w(sam@sam.com rob@rob.com) }
    before { fill_in_emails valid_emails }

    it "redirects to classroom show" do
      submit_form
      expect(current_path).to eql classroom_students_path(classroom)
    end

    it "creates students" do
      expect { submit_form }.to change { Student.count }.by(valid_emails.count)
    end

    it "sends emails" do
      expect { submit_form }
        .to change { ActionMailer::Base.deliveries.count }.by(valid_emails.count)
    end
  end

  context "with invalid emails" do
    let(:invalid_emails) { %w(sam.com bob) }
    let(:valid_emails) { %w(sam@sam.com rob@rob.com) }
    let(:emails) { invalid_emails + valid_emails }

    before { fill_in_emails emails }

    it "rerenders page" do
      submit_form
      expect(page).to show_new_student_heading
    end

    it "shows which emails were invalid" do
      submit_form
      within(".errors") do
        invalid_emails.each do |invalid_email|
          expect(page).to have_content invalid_email
        end
      end
    end

    it "only creates students with valid emails" do
      expect { submit_form }.to change { Student.count }.by(valid_emails.count)
    end

    it "only sends emails to valid emails" do
      expect { submit_form }
        .to change { ActionMailer::Base.deliveries.count }.by(valid_emails.count)
    end
  end
end
