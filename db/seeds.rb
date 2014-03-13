# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_admins_and_teachers
  1.upto(2) do |n|
    Admin.create! first_name: 'Admin',
                  last_name: "#{n}",
                  email: "admin#{n}@ros.org",
                  password: 'password'
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
    Student.create! first_name: "Student",
                    last_name: "#{n}",
                    password: 'password',
                    email: "student#{n}@ros.org"
  end
end

def create_modules
  LearningModule.create!  name: "Fundamentals",
                          number: 1
  LearningModule.create!  name: "Water",
                          number: 2
  LearningModule.create!  name: "Waste",
                          number: 3
  LearningModule.create!  name: "Transportation",
                          number: 4
  LearningModule.create!  name: "Energy",
                          number: 5
  LearningModule.create!  name: "Building",
                          number: 6
  LearningModule.create!  name: "Health, Food, and Agriculture",
                          number: 7
  LearningModule.create!  name: "Community Organizing and Leadership",
                          number: 8
  LearningModule.create!  name: "Application and Practice",
                          number: 9
  LearningModule.create!  name: "Financial Literacy and Social Entrepreneurship",
                          number: 10
end

create_admins_and_teachers
create_classroom
create_modules