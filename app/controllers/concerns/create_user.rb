class CreateUser
  def self.execute(klass, params)
    u = klass.create(params)
    u.send_reset_password_instructions unless u.new_record?
    u.new_record?
  end
end
