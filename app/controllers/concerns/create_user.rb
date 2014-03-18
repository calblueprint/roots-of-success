class CreateUser

  def self.execute(klass, params)
    pass = params[:password]
    if (u = klass.create(params)).new_record?
      UserMailer.welcome_email u, pass
    end
    return u.new_record?
  end
end 
