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
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1LksTZoVGU40wLXLTbwr06WaCKZO6Fko1_6-dsva25b4/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>'
  )
  prog(1).create_participant_survey!(
    name: "For Correctional Institutions",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1ccnL5EbuDwDBQxa9ATprtzyQYAva6Kpth8L4X8HxUGE/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>'
  )
  prog(2).create_participant_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1LksTZoVGU40wLXLTbwr06WaCKZO6Fko1_6-dsva25b4/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>'
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
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1LksTZoVGU40wLXLTbwr06WaCKZO6Fko1_6-dsva25b4/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>'
  )
  prog(5).create_participant_survey!(
    name: "For High School Students",
    description: "Once the class is finished, click to email this required survey to all verified students.",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1OobIDBKY6VMhbK9Wi2kwBiYtvbIF3lHxNccrfOmOMus/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>'
  )

  prog(0).create_teacher_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, fill this survey out.",
    url: "http://goo.gl/forms/v9fZRjrvMq2IrLK82",
  )

  prog(1).create_teacher_survey!(
    name: "For Correctional Institutions",
    description: "Once the class is finished, fill this survey out.",
    url: "http://goo.gl/forms/ppXgfF4sudpuqd412",
  )

  prog(2).create_teacher_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, fill this survey out.",
    url: "http://goo.gl/forms/v9fZRjrvMq2IrLK82",
  )

  prog(4).create_teacher_survey!(
    name: "For Job Training, Workforce Development and Re-entry Programs",
    description: "Once the class is finished, fill this survey out.",
    url: "http://goo.gl/forms/v9fZRjrvMq2IrLK82",
  )

  prog(5).create_teacher_survey!(
    name: "For High School Students",
    description: "Once the class is finished, fill this survey out.",
    url: "http://goo.gl/forms/n4rlB1l6WtfGug6J3",
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

def seed_quizzes
  Quiz.create!( # sample
    program: Program.find_by(name: "Standard Version for Adults"),
    name: "Fundamentals Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1HuAqZnkjNJsJTRMIErui1Ilk9KL_eIdeTqSEAZiW9go/viewform?embedded=true" frameborder="0" width="551" height="500" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!( # sample2
    program: Program.find_by(name: "Standard Version for Adults"),
    name: "Water Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1HuAqZnkjNJsJTRMIErui1Ilk9KL_eIdeTqSEAZiW9go/viewform?embedded=true" frameborder="0" width="551" height="500" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Fundamentals Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSewaUTqOl5-P9KQhOvz2iH80K3Nl9C_hJO7_siMcglQJRVjkA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Water Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScl7Oaon0Jz69Q7_dHmjo1fJ7pQQSj6XtqkeVtgFBBF9djRwg/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Waste Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSdDF2S9w_A9zDd81jWZ6FjqDVst2fvkSn4a5B8QaB9de6CHyA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Transportation Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSee1dR4KCIZ6byNiv5vT1SxPUH_y5-po_dJkPij3l4SYM2PdA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Energy Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSfpeqnQbZ-t1jGg35x2J5OLnY45sI9VUNERXH5Te_0I32s7iw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Building Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSeIYVs_NLEjD0Ke021Y5Zon5gQsWlXjGVprPl_hGlv9ltTKUA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Health, Food, & Agriculture Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSfQnPquIzRjqmTgRAPEFjWK05OxPRlD6GGhx4lwAJ5LEr0lMw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Community Organizing & Leadership Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSeeGRiujwILcncqR5iMU_FkdiaYdv48b73GSd2t3bsfQbc-pw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Financial Literacy & Social Entrepreneurship Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSeek01C5pXJoHHHO0TBPiOTcOzTxseWZCWnmp5Hhbf_Fn70rA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Fundamentals Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSeuwLMdMpgA9xi6IjmaPydDIaEVpJkR7v6FS12lhiYLciQYWQ/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Water Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSdVPsZU6gHz4ylLRpgoY7OJw18gFAo4RsH2ueDRCk3-kGU0dw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Waste Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSfpHy3S2CUIMWKOZ2FEfJWpmsUE3YYtQcqHNJlC6wsTfqcz8Q/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Transportation Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSdBzy4SmU3qfgCHq3qjxo1Tt-4r4EqFb6og4_SmSyhA6ZH1sg/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>'
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Energy Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScXRfTmn1z9CC_oA8lVQAF6Wn2DTy_wmK8NR0VAvC4dHLUN3g/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Building Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSfhljFVpBb3SelbzmvgfvXG-3n0KYWsLhFZcrpNs6rd3l6R0Q/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Health, Food, & Agriculture Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSfkK_3JAbWSKcC3Md64M4jta1O3iDS8GWGRJb6UbazOScORoA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Community Organizing & Leadership Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScOUCgV3VALwls_eFHzEwG_gJ1wSzxPNT_byrkb0UJ7hQMUbg/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Financial Literacy & Social Entrepreneurship Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSdq2L8i1bSXVqptYXfTRij3EM6qQ5W-XpsUDgIH0SJoXlAC6g/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Fundamentals Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSd_Bg9F0XKKm337pmO9yMhfWePBYS2jox_qqQ786Z1qeJ3F7A/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Water Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSdR8_IziK-8ZgUuDqJSHWBL72zh7VGsH_MeesWwqPD4g2MjUw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Waste Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSfbyVJu7mWUfPS5mLDmfayMOmetWmz85b9bUGdq0e5Cr1XfJw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Transportation Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSeOZAC_XNyiQ9sPMxAp3ZbzDDp3L_iroXDZINATluTcD5nVpw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Energy Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScuQ3LOhga0Ju281E4kvs7vuLQVWkJxFVBiJxM7RDlxwJPuDA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Building Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScJuOyweRu1cLc58G_3YFJKWePOXSVj5aQjsyxGNhyOlMlZrw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Health, Food, & Agriculture Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSfTAFY2tE0vXGssDZmQAgZgUgwssPWETZRzHXobtr5g9Z61ag/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Community Organizing & Leadership Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSeFR1XeYC2jnvIT4lijaBDuY0Vn7sjw2ky9fYMdKQviKi79iw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Financial Literacy & Social Entrepreneurship Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/e/1FAIpQLSdhrcm8h8w1fuecByNB1HPiZvc-Josr6h7sTGAQvVMyHDX-lw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
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
seed_quizzes unless Quiz.any?
