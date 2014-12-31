# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  Teacher.create! first_name: "Teacher",
                  last_name: "#{n}",
                  email: "teacher#{n}@ros.org",
                  password: "password"
end

["Standard Version for Adults", "Prisons, Jails, and Juvenile Facilities", "Social Entrepreneurs",
 "en Espanol", "United Kingdom", "High Schools and Youth Programs"].each do |program_name|
  Program.create! name: program_name,
                  slug: program_name.underscore.gsub(" ", "_")
end

program = Program.first

Teacher.all.each do |t|
  t.classrooms.create! name: "#{t.first_name}'s Classroom",
                       description: Faker::Lorem.paragraph(3),
                       program: program
end
