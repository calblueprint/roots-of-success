class TeacherSerializer < ActiveModel::Serializer
  UPDATABLE_ATTRS = [:first_name, :last_name, :email, :phone, :position, :location]
  root false
  attributes :id, :first_name, :last_name, :email, :phone,
             :position, :location, :updatable_attrs

  def updatable_attrs
    UPDATABLE_ATTRS
  end
end
