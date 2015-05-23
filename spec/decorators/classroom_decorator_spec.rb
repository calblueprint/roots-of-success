require "rails_helper"

describe ClassroomDecorator do
  let(:classroom) { create :classroom }
  let!(:classroom_module_presents) { create_pair :classroom_module_present, classroom: classroom }
  let!(:unsurveyed_students) { create_pair :student, classroom: classroom, survey_administered: false }
  let!(:surveyed_students) { create_pair :student, classroom: classroom, survey_administered: true }

  subject { ClassroomDecorator.decorate classroom }

  describe "#presented_modules_count" do
    it "returns the count of presented modules" do
      expect(subject.presented_modules_count).to eql 2
    end
  end

  describe "#presented_modules_label" do
    it "returns pluralized label" do
      expect(subject.presented_modules_label).to eql "Modules presented"
      classroom_module_presents.first.destroy
      expect(subject.presented_modules_label).to eql "Module presented"
    end
  end

  describe "#survey_stats" do
    it "returns 'survey_administered students' of 'total students'" do
      expect(subject.survey_stats).to eql "2 of 4"
    end
  end

  describe "#survey_stats_label" do
    it "returns label" do
      expect(subject.survey_stats_label).to eql "Surveys taken"
    end
  end
end
