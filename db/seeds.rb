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
  number = index + 1
  Program.all.each do |program|
    LearningModule.create! name: module_name,
                           number: number,
                           presentation_embed_code: "embed",
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

ParticipantSurvey.create! name: "Survey for Participants", form_embed_code: "html embed"
TeacherSurvey.create! name: "Survey for Teachers", form_embed_code: "html embed"
