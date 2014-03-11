class AdminDashboardController < ApplicationController
  def index
  end

  def new_teacher
    @bad_addrs = Array.new
    @teacher = Teacher.new
  end

  def create_teacher
    addrs = teacher_params[:email]
    @addr_list = addrs.gsub(/\r?\n|\s/,'').split(",")
    @bad_addrs = @addr_list
    @addr_list.each do|a|
      password = SecureRandom.hex 10
      t = Teacher.create email: a, password: password
      if !t.new_record?
        @bad_addrs.delete a 
        UserMailer.welcome_email(t).deliver
      end
    end
    if @bad_addrs.empty?
      flash[:success] = "Created all teachers!"
      redirect_to admin_dashboard_index_path
    else
      render 'new_teacher'
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:email)
  end
end
