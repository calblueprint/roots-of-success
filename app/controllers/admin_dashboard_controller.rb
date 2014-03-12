class AdminDashboardController < ApplicationController
  def index
  end

  def new_teacher
    @bad_addrs = Array.new
    @teacher = Teacher.new
  end

  def create_teacher
    addrs = teacher_params[:emails]
    @addr_list = addrs.gsub(/\r?\n|\s+/,'').split(',')
    @bad_addrs = @addr_list.select{ |e| (@t = Teacher.create(email: e, password: (SecureRandom.hex 10))).new_record? || !UserMailer.welcome_email(@t).deliver }
    if @bad_addrs.empty?
      flash[:success] = "Created all teachers!"
      redirect_to admin_dashboard_index_path
    else
      render 'new_teacher'
    end
  end

  private

  def teacher_params
    params.require(:teachers).permit(:emails)
  end
end
