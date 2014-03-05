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


create_users
create_classroom