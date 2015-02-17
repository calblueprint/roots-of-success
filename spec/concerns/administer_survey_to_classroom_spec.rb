require "rails_helper"

RSpec.describe AdministerSurveyToClassroom do
  let(:classroom) { create :classroom }
  let(:unconfirmed_students) { create_pair :student, classroom: classroom, confirmed: false }
  let(:confirmed_students) do
    create_pair :student, classroom: classroom, confirmed: true, survey_administered: false
  end
  let(:confirmed_and_surveyed_students) do
    create_pair :student, classroom: classroom, confirmed: true, survey_administered: true
  end

  def confirmed_as_relation
    classroom.students.confirmed.survey_not_administered
  end

  def job_mock
    mock = double("StudentSurveyMailerJob")
    expect(mock).to receive(:async).once.and_return(mock)
    expect(mock).to receive(:perform).with(confirmed_as_relation, classroom: classroom).once
    mock
  end

  describe ".execute" do
    it "only sends emails to confirmed students that have not taken surveys" do
      expect(StudentSurveyMailerJob).to receive(:new).and_return job_mock
      AdministerSurveyToClassroom.execute classroom
    end
  end
end
