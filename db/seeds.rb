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
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Fundamentals Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dG1INDJIY205Zzg2NXVudXliWVVmQlE6MA" frameborder="0" width="551" height="655" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Water Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dGhSSk1hQzA1WHNDUjk2SWxsNU5HbVE6MA" frameborder="0" width="551" height="655" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Waste Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dEV5aU8tR1hRZXJrbzRGMDA0YS1DcXc6MA" frameborder="0" width="551" height="655" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Transportation Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1_zN3Afy_ez-y5yx3iVDjRFif-MTbaSEmys_PCsbGPU8/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Energy Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1AeFTswRp2v-X9-7wo8fGNuNK1yxYEHkHRGa58W_SNZY/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Building Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1WXFapJCAYlMLOnuGslATjt4BapoL5lgpc5IQVosFIo8/viewform?embedded=true" frameborder="0" width="551" height="500" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Health, Food, & Agriculture Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1QQ0265IS7K6F8uBicF0bCn-XG-pZCRuHU2OTOicp84Q/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Community Organizing & Leadership Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1aVJnjFipew5vfxEaqRHTOalktFNhihlhfYUdK0PAEe8/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Social Entrepreneurs"),
    name: "Financial Literacy & Social Entrepreneurship Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1W0zo-kCtQef56AeqV7QZBOFxOoDnzQZCXKYpL8anDCA/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Fundamentals Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/18gwcfUX3b7Sybl5CAYgFVDYjiLYdpIRIZz-z0rXcr_w/viewform?embedded=true" frameborder="0" width="551" height="500" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Water Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1YhqNB-BQHRk0GIB7S3KtXJxOiZIa67EHUerZWiBWDSo/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Waste Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1qQcmoctkyoftE5hF3DGopf981IJe6AjYu4Hy1rhUDKI/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Transportation Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1qO53z3Nab5u_3S1_V4uAwAO4qEy2FbLBB-ACVLotp-s/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Energy Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1bCN5RBAyN5RMsOZTBHazXiOHNdqI18Y8ej9Va6G_pNQ/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Building Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1eIvOjEo_Ioz3WIntJjHtjCzLdfzP-ygzRQPlpcylDkk/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Health, Food, & Agriculture Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1kaoJZixRVTdP5q6ZXuhZsm7XoPPXvSMqob81St31eR8/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Community Organizing & Leadership Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1VV7PDI9H9iDn6c3BM9lmJQkQAkfELcahHKRpozLQGVc/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "High Schools and Youth Programs"),
    name: "Financial Literacy & Social Entrepreneurship Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1DDz1MZR7rp3UwePrUyMymZojDpMoc5WVFnOUm1t9D3E/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Fundamentals Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1HuAqZnkjNJsJTRMIErui1Ilk9KL_eIdeTqSEAZiW9go/viewform?embedded=true" frameborder="0" width="551" height="500" marginheight="0" marginwidth="0"></iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Water Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1tCiKLSDtULD046eXaPmvJu_u-lHsD8b9PFH6zeSg3hk/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Waste Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1qBV0CLHduQD8LmDKUx6TK7C6YeeRo2SIdXSuJ9Lynr8/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Transportation Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1EFJBPqNTuUVXs8bAGdGtMJ5cQC0YtDSBP2vaH3EAzWw/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Energy Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/14Mk0-Xt4ESrZrDjGMr2U0xuGpRWR9zDHmeyG9exMURQ/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Building Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1Tk173V0_juhOgZHoCBWY9WPLzldTqiqWY3OFh9Y2T9U/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Health, Food, & Agriculture Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1FFs8qXRL0V2Jg8xIyEfsyJxyusUv44dN445YARQ9JmE/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Community Organizing & Leadership Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1hGazJhEWmlSRUoe2OwAeCH_JFgU7L96MXwK5E_4ZfM0/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
  )
  Quiz.create!(
    program: Program.find_by(name: "Prisons, Jails, and Juvenile Facilities"),
    name: "Financial Literacy & Social Entrepreneurship Module Quiz",
    form_embed_code: '<iframe src="https://docs.google.com/forms/d/1evJo3weYpMyAYobWjavqVXehSyiwdTAnxuvTZJiIGWk/viewform?embedded=true" width="760" height="500" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>',
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
