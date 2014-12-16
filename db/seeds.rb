SEEDS = YAML.load(File.read(File.expand_path('../seeds.yml', __FILE__)))

def create_admins_and_teachers
  1.upto(2) do |n|
    Admin.create! first_name: 'Admin',
                  last_name: "#{n}",
                  email: "admin#{n}@ros.org",
                  password: 'password',
                  forem_admin: true
  end
  1.upto(50) do |n|
    Teacher.create! first_name: 'Teacher',
                    last_name: "#{n}",
                    password: 'password',
                    email: "teacher#{n}@ros.org"
  end
end

def create_classroom
  t = Teacher.first
  c = t.classrooms.create! name: 'Classroom 1', program: 'High School'
  c.students = 1.upto(10).map do |n|
    Student.create! first_name: 'Student',
                    last_name: "#{n}",
                    password: 'password',
                    email: "student#{n}@ros.org"
  end
  c.students.map(&:set_survey_progress!)
end

def confirm_users
  User.update_all confirmed_at: Time.now
end

def create_modules
  SEEDS[:module_names].each_with_index do |name, i|
    t = LearningModuleTopic.create! topic: name,
                                    number: i + 1
    t.learning_modules = SEEDS[:modules].select { |m| m[:name] == name }
                                        .map do |m_attributes|
      LearningModule.create! m_attributes
    end
  end
end

def create_surveys
  AllTeachersSurvey.create! SEEDS[:all_teachers_survey]
  CorrectionalFacilityTeacherSurvey.create! SEEDS[:correctional_facility_teacher_survey]
  HighSchoolTeacherSurvey.create! SEEDS[:high_school_teacher_survey]
  HighSchoolStudentSurvey.create! SEEDS[:high_school_student_survey]
end

def create_forums
  # Force-decorate the User class in case it hasn't been yet. Fixes #495.
  Forem.decorate_user_class!

  user = Forem.user_class.first

  SEEDS[:versions].each do |version|
    category = Forem::Category.create name: version

    Forem::Forum.create category_id: category.id,
                        name: 'General',
                        description: 'General discussion'

    SEEDS[:module_names].each do |name|
      Forem::Forum.create category_id: category.id,
                          name: 'Module: ' + name,
                          description: name + \
                            ' module discussion for ' + version.downcase
    end
  end
end

create_modules
create_admins_and_teachers
create_classroom
confirm_users
create_surveys
create_forums
