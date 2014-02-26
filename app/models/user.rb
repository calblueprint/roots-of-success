class User < ActiveRecord::Base
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :first_name, :last_name, :email, :password,
                  :password_confirmation, :remember_me, :type
                  
  def name
    return "#{first_name} #{last_name}"
  end

end