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

PROGRAMS = ["Standard Version for Adults", "Prisons, Jails, and Juvenile Facilities", "Social Entrepreneurs",
            "en Espanol", "United Kingdom", "High Schools and Youth Programs"]
PROGRAMS.each do |program_name|
  Program.create! name: program_name,
                  slug: program_name.underscore.gsub(" ", "_")
end

LEARNING_MODULES = ["Fundamentals", "Water", "Waste", "Transportation", "Energy",
                    "Building", "Health, Food, and Agriculture", "Community Organizing and Leadership",
                    "Application and Practice", "Financial Literacy and Social Entrepreneurship"]

LEARNING_MODULES.each_with_index do |module_name, index|
  number = index
  Program.all.each do |program|
    LearningModule.create name: module_name,
                          number: number,
                          presentation_embed_code: "embed"
                          program: program
  end
end

program = Program.first

Teacher.all.each do |t|
  5.times do |n|
    t.classrooms.create! name: "#{t.first_name}'s Classroom #{n}",
                         description: Faker::Lorem.paragraph(3),
                         program: program
  end
end
