def seed_teachers
  10.times do |n|
    Teacher.create!(
      first_name: "Teacher",
      last_name: "#{n}",
      email: "teacher#{n}@ros.org",
      password: "password"
    )
  end
end

# Note that the seed_surveys method depends on this order. Don't reorder these without editing that method.
PROGRAMS = ["Standard Version for Adults", "Prisons, Jails, and Juvenile Facilities", "Social Entrepreneurs",
            "en Espanol", "United Kingdom", "High Schools and Youth Programs"]
def seed_programs
  PROGRAMS.each do |program_name|
    Program.create!(
      name: program_name,
      slug: program_name.underscore.gsub(" ", "_")
    )
  end
end

LEARNING_MODULES = ["Fundamentals", "Water", "Waste", "Transportation", "Energy",
                    "Building", "Health, Food, and Agriculture", "Community Organizing and Leadership",
                    "Application and Practice", "Financial Literacy and Social Entrepreneurship"]
def seed_learning_modules
  LEARNING_MODULES.each_with_index do |module_name, index|
    number = index + 1
    Program.all.each do |program|
      LearningModule.create!(
        name: module_name,
        number: number,
        presentation_embed_code: '<iframe src="https://docs.google.com/presentation/d/1Uqs0xTXJMdoSVCoR-wzlc2U_0BeBJf4VMrUcCu0lDK4/embed?start=false&loop=false&delayms=3000" frameborder="0" width="960" height="749" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>',
        program: program
      )
    end
  end
end

def seed_classrooms
  program = Program.first
  Teacher.all.each do |t|
    5.times do |n|
      t.classrooms.create!(
        name: "#{t.first_name}'s Classroom #{n}",
        description: FFaker::Lorem.paragraph(3),
        program: program
      )
    end
  end
end

def seed_pre_post_test
  PrePostTest.create!(
    description: "This is the survey you give to students before and after each class.",
    link: "https://rootsofsuccesscurriculum.files.wordpress.com/2012/02/2-participant-pre-test.pdf",
  )
end

def seed_surveys
  def prog(index)
    Program.find_by name: PROGRAMS[index]
  end
  # TODO(sam): These embed codes are all wrong
  prog(0).create_participant_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFlPaWhjbjhsQWZzX25RSnFqdm5zVVE6MQ" frameborder="0" width="551" height="640" marginheight="0" marginwidth="0"></iframe>'
  )
  prog(1).create_participant_survey!(
    name: "For Correctional Institutions",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFlPaWhjbjhsQWZzX25RSnFqdm5zVVE6MQ" frameborder="0" width="551" height="640" marginheight="0" marginwidth="0"></iframe>'
  )
  prog(2).create_participant_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFlPaWhjbjhsQWZzX25RSnFqdm5zVVE6MQ" frameborder="0" width="551" height="640" marginheight="0" marginwidth="0"></iframe>'
  )
  # No survey for Spanish program yet.
  # prog(3).create_participant_survey!(
  #   name: "For High School Students",
  #   description: "Once the class is finished, click to email this required survey to all verified students.",
  #   form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFlPaWhjbjhsQWZzX25RSnFqdm5zVVE6MQ" frameborder="0" width="551" height="640" marginheight="0" marginwidth="0"></iframe>'
  # )
  prog(4).create_participant_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFlPaWhjbjhsQWZzX25RSnFqdm5zVVE6MQ" frameborder="0" width="551" height="640" marginheight="0" marginwidth="0"></iframe>'
  )
  prog(5).create_participant_survey!(
    name: "For High School Students",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dFlPaWhjbjhsQWZzX25RSnFqdm5zVVE6MQ" frameborder="0" width="551" height="640" marginheight="0" marginwidth="0"></iframe>'
  )

  prog(0).create_teacher_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, fill this survey out.",
    url: "https://rootsofsuccesscurriculum.files.wordpress.com/2012/02/4-instructor-survey.pdf",
  )

  prog(1).create_teacher_survey!(
    name: "For Correctional Institutions",
    description: "Once the class is finished, fill this survey out.",
    url: "https://rootsofsuccesscurriculum.files.wordpress.com/2012/02/4-instructor-survey.pdf",
  )

  prog(2).create_teacher_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, fill this survey out.",
    url: "https://rootsofsuccesscurriculum.files.wordpress.com/2012/02/4-instructor-survey.pdf",
  )

  prog(4).create_teacher_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, fill this survey out.",
    url: "https://rootsofsuccesscurriculum.files.wordpress.com/2012/02/4-instructor-survey.pdf",
  )

  prog(5).create_teacher_survey!(
    name: "For High School Students",
    description: "Once the class is finished, fill this survey out.",
    url: "https://rootsofsuccesscurriculum.files.wordpress.com/2012/02/4-instructor-survey.pdf",
  )
end

def seed_admin_user
  AdminUser.create! email: "admin@ros.org", password: "password"
end

def seed_change_log_items
  ChangelogItem.create! text: "This is the first update."
  ChangelogItem.create! text: "This is the second update."
end

def seed_supplemental_materials
  SupplementalMaterial.create!(
    name: "Helpful video",
    content: "[Click here](https://youtu.be/6lutNECOZFw)",
    classroom: Classroom.first,
  )
  SupplementalMaterial.create!(
    name: "Helpful video 2",
    content: "[Click me](https://youtu.be/o8E-2jeQ8M0)",
    classroom: Classroom.first,
  )
end

seed_teachers unless Teacher.any?
seed_programs unless Program.any?
seed_learning_modules unless LearningModule.any?
seed_classrooms unless Classroom.any?
seed_pre_post_test unless PrePostTest.any?
seed_surveys unless TeacherSurvey.any?
seed_admin_user unless AdminUser.any?
seed_change_log_items unless ChangelogItem.any?
seed_supplemental_materials unless SupplementalMaterial.any?
