
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
  c = t.classrooms.create! name: 'Classroom 1'
  c.students = 1.upto(10).map do |n|
    Student.create! first_name: 'Student',
                    last_name: "#{n}",
                    password: 'password',
                    email: "student#{n}@ros.org"
  end
end

def confirm_users
  User.update_all confirmed_at: Time.now
end

$module_names = [
  'Fundamentals',
  'Water',
  'Waste',
  'Transportation',
  'Energy',
  'Building',
  'Health, Food, and Agriculture',
  'Community Organizing and Leadership',
  'Application and Practice',
  'Financial Literacy and Social Entrepreneurship'
]

def create_modules
  $module_names.each_with_index do |name, i|
    LearningModule.create! name: name,
                           number: i + 1
  end
end

def create_surveys
  AllTeachersSurvey.create!(
    name: 'All Teachers',
    link: 'https://docs.google.com/forms/d/19gKLLu50bf1U3mZ_rEKNXeGiamRVprJhWwdCSL8xq0Q/viewform?usp=send_form')
  CorrectionalFacilityTeacherSurvey.create!(
    name: 'Survey for Correctional Facility Teachers',
    link: 'https://docs.google.com/forms/d/1SRBPD-C3ijlrX7jturb6I5UGqcA1bwEU715S4m0n0rk/viewform?usp=send_form')
  HighSchoolTeacherSurvey.create!(
    name: 'Survey for High School Teachers',
    link: 'https://docs.google.com/forms/d/1CWoe0o43J_KCvbfkE3JHKT1-tJud5rwxhnJUC4IfbtQ/viewform?usp=send_form')
  HighSchoolStudentSurvey.create!(
    name: 'Survey for High School Students',
    link: 'https://docs.google.com/forms/d/1QlTArPBO7ZS29ygU85AOr82klmQCPpeWlRGrBL9M-7Q/viewform?usp=send_form')
end

def create_forums
  # Force-decorate the User class in case it hasn't been yet. Fixes #495.
  Forem.decorate_user_class!

  user = Forem.user_class.first

  category_names = ['High School Teachers', 'Correctional Facility Teachers',
    'Adult Teachers']
  category_names.each do |category_name|
    category = Forem::Category.create name: category_name

    Forem::Forum.create category_id: category.id,
                        name: 'General',
                        description: 'General discussion'

    $module_names.each do |module_name|
      Forem::Forum.create category_id: category.id,
                          name: 'Module: ' + module_name,
                          description: module_name + \
                            ' module discussion for ' + category_name.downcase
    end
  end
end

create_modules
create_admins_and_teachers
create_classroom
confirm_users
create_surveys
create_forums
