def seed_teachers
  10.times do |n|
    Teacher.create! first_name: "Teacher",
                    last_name: "#{n}",
                    email: "teacher#{n}@ros.org",
                    password: "password"
  end
end

PROGRAMS = ["Standard Version for Adults", "Prisons, Jails, and Juvenile Facilities", "Social Entrepreneurs",
            "en Espanol", "United Kingdom", "High Schools and Youth Programs"]
def seed_programs
  PROGRAMS.each do |program_name|
    Program.create! name: program_name,
                    slug: program_name.underscore.gsub(" ", "_")
  end
end

LEARNING_MODULES = ["Fundamentals", "Water", "Waste", "Transportation", "Energy",
                    "Building", "Health, Food, and Agriculture", "Community Organizing and Leadership",
                    "Application and Practice", "Financial Literacy and Social Entrepreneurship"]
def seed_learning_modules
  LEARNING_MODULES.each_with_index do |module_name, index|
    number = index + 1
    Program.all.each do |program|
      LearningModule.create! name: module_name,
                             number: number,
                             presentation_embed_code: '<iframe src="https://docs.google.com/presentation/d/1Uqs0xTXJMdoSVCoR-wzlc2U_0BeBJf4VMrUcCu0lDK4/embed?start=false&loop=false&delayms=3000" frameborder="0" width="960" height="749" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>',
                             program: program
    end
  end
end

def seed_classrooms
  program = Program.first
  Teacher.all.each do |t|
    5.times do |n|
      t.classrooms.create! name: "#{t.first_name}'s Classroom #{n}",
                           description: FFaker::Lorem.paragraph(3),
                           program: program
    end
  end
end

def seed_surveys
  ParticipantSurvey.create! name: "Survey for Participants",
                            description: "Once the class is finished, click to email this required survey to all verified students.",
                            form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFlPaWhjbjhsQWZzX25RSnFqdm5zVVE6MQ" frameborder="0" width="551" height="640" marginheight="0" marginwidth="0"></iframe>'
  TeacherSurvey.create! name: "Survey for Teachers",
                        description: "Once this class is finished, fill this survey out.",
                        form_embed_code: "html embed"
end

def seed_admin_user
  AdminUser.create! email: "admin@ros.org", password: "password"
end

def seed_change_log_items
  ChangelogItem.create! text: "This is the first update."
  ChangelogItem.create! text: "This is the second update."
end

seed_teachers unless Teacher.any?
seed_programs unless Program.any?
seed_learning_modules unless LearningModule.any?
seed_classrooms unless Classroom.any?
seed_surveys unless TeacherSurvey.any?
seed_admin_user unless AdminUser.any?
seed_change_log_items unless ChangelogItem.any?
