# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_dev_team  
  User.create(first_name: 'Deepak', last_name: 'Warrier')
  User.create(first_name: 'Alli', last_name: 'Leong')
  User.create(first_name: 'Ethan', last_name: 'Chiou')
  User.create(first_name: 'Jonathan', last_name: 'Ho')
  User.create(first_name: 'Vincent', last_name: 'Tian')
  User.create(first_name: 'Sam', last_name: 'Lau')
end

def create_users_1  
  Admin.create(first_name: 'Admin1', last_name: 'Admin1')
  Admin.create(first_name: 'Admin2', last_name: 'Admin2')
  Teacher.create(first_name: 'Teacher1', last_name: 'Teacher1')
  Teacher.create(first_name: 'Teacher2', last_name: 'Teacher2')
  Student.create(first_name: 'User1', last_name: 'User1')
  Student.create(first_name: 'User2', last_name: 'User2')
end

create_users_1
