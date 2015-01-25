# Logs in a teacher
def login_teacher(teacher)
  visit new_teacher_session_path
  fill_in "Email", with: teacher.email
  fill_in "Password", with: teacher.password
  click_button "Log in"
end

# Returns object that can take any method ; used for stubbing method chains
def null_object
  double("null_object").as_null_object
end

# Returns id selector for object
def id_of(obj)
  "##{dom_id obj}"
end
