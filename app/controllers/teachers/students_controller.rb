module Teachers
  class StudentsController < BaseController
    load_and_authorize_resource # loads @student{s}

    before_filter :set_classroom, only: [:new, :create, :index]
    before_filter :set_active_tab, only: [:index]

    # new and create actions are modified to create many students at a time.
    def new
    end

    def create
      email_validator = ValidateEmails.new(params[:students][:emails])
      CreateStudents.execute email_validator.valid_emails, classroom: @classroom

      if email_validator.all_valid?
        redirect_to classroom_students_path(@classroom), flash: { success: "Invited students!" }
      else
        @invalid_emails = email_validator.invalid_emails
        @value = @invalid_emails.join "\n"
        render "new"
      end
    end

    def index
      @students = @classroom.students
      gon.push addStudentsUrl: new_classroom_student_path(@classroom)
    end

    private

    def set_classroom
      @classroom = Classroom.find params[:classroom_id]
    end

    def set_active_tab
      @active_tab = "students"
    end
  end
end
