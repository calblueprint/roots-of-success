# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_users
  Admin.create! first_name: 'Admin1', 
                last_name: 'Admin1', 
                password: 'password',
                email: 'test1@test.com'
  Admin.create! first_name: 'Admin2', 
                last_name: 'Admin2', 
                password: 'password',
                email: 'test2@test.com'
  Teacher.create! first_name: 'Teacher1', 
                last_name: 'Teacher1', 
                password: 'password',
                email: 'test3@test.com'
  Teacher.create! first_name: 'Teacher2', 
                last_name: 'Teacher2', 
                password: 'password',
                email: 'test4@test.com'
  Student.create! first_name: 'User1', 
                last_name: 'User1', 
                password: 'password',
                email: 'test5@test.com'
  Student.create! first_name: 'User2', 
                last_name: 'User2', 
                password: 'password',
                email: 'test6@test.com'
end

def create_classroom
  t = Teacher.create! first_name: 'Teacher1', 
                      last_name: 'Teacher1', 
                      password: 'password',
                      email: 'teacher@teacher.com'
  c = t.classrooms.create
  student_list = []
  1.upto(10) do |n|
    s = Student.create! first_name: "Student #{n}",
                        last_name: "Student",
                        password: 'password',
                        email: "Student#{n}@gmail.com"
    student_list << s
  end
  c.students = student_list
end

def create_modules
  LearningModule.create! name: "Fundamentals",
                        module_number: 1
  LearningModule.create! name: "Water",
                        module_number: 2
  LearningModule.create! name: "Waste",
                        module_number: 3
  LearningModule.create! name: "Transportation",
                        module_number: 4
  LearningModule.create! name: "Energy",
                        module_number: 5
  LearningModule.create! name: "Building",
                        module_number: 6
  LearningModule.create! name: "Health, Food, and Agriculture",
                        module_number: 7
  LearningModule.create! name: "Community Organizing and Leadership",
                        module_number: 8
  LearningModule.create! name: "Application and Practice",
                        module_number: 9
  LearningModule.create! name: "Financial Literacy and Social Entrepreneurship",
                        module_number: 10
end






create_users
create_classroom
create_modules