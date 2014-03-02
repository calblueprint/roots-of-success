# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_dev_team  
  Admin.create(first_name: 'Deepak', last_name: 'Warrier', email: 'deeps@deeps.com')
  Admin.create(first_name: 'Alli', last_name: 'Leong', email: 'alli@alli.com')
  Admin.create(first_name: 'Ethan', last_name: 'Chiou', email: 'ethan@ethan.com')
  Admin.create(first_name: 'Jonathan', last_name: 'Ho', email: 'jon@jon.com')
  Admin.create(first_name: 'Vincent', last_name: 'Tian', email: 'vin@vin.com')
  Admin.create(first_name: 'Sam', last_name: 'Lau', email: 'sam@sam.com')
end

def create_users_1  
  Admin.create(first_name: 'Admin1', last_name: 'Admin1', email: 'test1@test.com')
  Admin.create(first_name: 'Admin2', last_name: 'Admin2', email: 'test2@test.com')
  Teacher.create(first_name: 'Teacher1', last_name: 'Teacher1', email: 'test3@test.com')
  Teacher.create(first_name: 'Teacher2', last_name: 'Teacher2', email: 'test4@test.com')
  Student.create(first_name: 'User1', last_name: 'User1', email: 'test5@test.com')
  Student.create(first_name: 'User2', last_name: 'User2', email: 'test6@test.com')
end

create_users_1
