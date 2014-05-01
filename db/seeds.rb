
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

def create_modules
  LearningModule.create! name: 'Fundamentals',
                         number: 1
  LearningModule.create! name: 'Water',
                         number: 2
  LearningModule.create! name: 'Waste',
                         number: 3
  LearningModule.create! name: 'Transportation',
                         number: 4
  LearningModule.create! name: 'Energy',
                         number: 5
  LearningModule.create! name: 'Building',
                         number: 6
  LearningModule.create! name: 'Health, Food, and Agriculture',
                         number: 7
  LearningModule.create! name: 'Community Organizing and Leadership',
                         number: 8
  LearningModule.create! name: 'Application and Practice',
                         number: 9
  LearningModule.create! name: 'Financial Literacy and Social Entrepreneurship',
                         number: 10
end

def create_surveys
  AllTeachersSurvey.create!(
    name: 'All Teachers',
    link: 'https://docs.google.com/forms/d/19gKLLu50bf1U3mZ_rEKNXeGiamRVprJhWwdCSL8xq0Q/viewform?usp=send_form')
  CorrectionalFacilityTeachersSurvey.create!(
    name: 'Correctional Facility Teachers',
    link: 'https://docs.google.com/forms/d/1SRBPD-C3ijlrX7jturb6I5UGqcA1bwEU715S4m0n0rk/viewform?usp=send_form')
  HighschoolTeachersSurvey.create!(
    name: 'High School Teachers',
    link: 'https://docs.google.com/forms/d/1CWoe0o43J_KCvbfkE3JHKT1-tJud5rwxhnJUC4IfbtQ/viewform?usp=send_form')
  HighschoolStudentsSurvey.create!(
    name: 'High School Students',
    link: 'https://docs.google.com/forms/d/1QlTArPBO7ZS29ygU85AOr82klmQCPpeWlRGrBL9M-7Q/viewform?usp=send_form')
end

create_admins_and_teachers
create_classroom
confirm_users
create_modules
create_surveys

Forem::Engine.load_seed
