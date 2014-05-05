class UsersDatatable
  include Rails.application.routes.url_helpers
  delegate :params, :h, :link_to, to: :@view

  def initialize(klass, view)
    @view = view
    @klass = klass
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: @klass.count,
      iTotalDisplayRecords: users.count,
      aaData: data
    }
  end

  private

  def data
    users.map do |user|
      [
        link_to(user.email, profile_path(user)),
        ERB::Util.h(user.first_name),
        ERB::Util.h(user.last_name),
        ERB::Util.h(user.profile.curriculum_version),
        ERB::Util.h(user.profile.location)
      ]
    end
  end

  def users
    @users ||= get_users
  end

  def get_users
    users = @klass.order("#{sort_column} #{sort_direction}")
    users = users.page(page).per_page(per_page)
    if params[:sSearch].present?
      users = users.where("first_name like :search or last_name like :search", search: "%#{params[:sSearch]}%")
    end
    users
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
