class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone,
             :position, :location, :curriculum_version_id
end
