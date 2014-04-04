class TeachersDatatable
  delegate :params, :h, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Teacher.count,
      iTotalDisplayRecords: teachers.count,
      aaData: data
    }
  end

  private

  def data
    teachers.map do |teacher|
      [
        link_to(teacher.email, '#'),
        ERB::Util.h(teacher.first_name),
        ERB::Util.h(teacher.last_name)
      ]
    end
  end

  def teachers
    @teachers ||= get_teachers 
  end

  def get_teachers
    teachers = Teacher.order("#{sort_column} #{sort_direction}")
    teachers = teachers.page(page).per_page(per_page)
    if params[:sSearch].present?
      teachers = teachers.where("first_name like :search or last_name like :search", search: "%#{params[:sSearch]}%")
    end
    teachers
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[email first_name last_name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end

