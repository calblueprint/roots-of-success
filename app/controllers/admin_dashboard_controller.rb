class AdminDashboardController < ApplicationController
  def index
  end
 
  def show_teachers
    respond_to do |format|
      format.html
      format.json { render json: TeachersDatatable.new(view_context) }
    end
  end

  def new_teacher
    @bad_addrs = Array.new
    @teacher = Teacher.new
  end

  def create_teacher
    addr_list = teacher_params[:emails].strip.split(/,\s*/)
    @bad_addrs = addr_list.select do |e|
      CreateUser.execute(Teacher, password: (SecureRandom.hex 10), 
                                  email: e)
    end 
    if @bad_addrs.empty?
      flash[:success] = "Created all teachers!"
      redirect_to admin_dashboard_path
    else
      render 'new_teacher'
    end
  end

  private

  def teacher_params
    params.require(:teachers).permit(:emails)
  end
end
