class TeacherSerializer < ActiveModel::Serializer
  root false
  attributes :id, :first_name, :last_name, :email, :phone,
             :position, :location, :updatable_attrs

  def updatable_attrs
    [:first_name, :last_name, :email, :phone, :position, :location]
  end
end
