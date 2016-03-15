require "rails_helper"

RSpec.describe "The teacher dashboard" do
  let(:teacher) { create :teacher }
  let!(:classroom) { create :classroom, teacher: teacher, active: true }
  let!(:supplemental_materials) do
    create_pair :supplemental_material, classroom: classroom
  end

  before do
    login_teacher teacher
    visit classroom_supplemental_materials_path classroom
  end

  subject { page }

  it "displays the classroom's supplemental materials" do
    supplemental_materials.each do |supplemental_material|
      expect(page).to have_content supplemental_material.name
    end
  end
end
