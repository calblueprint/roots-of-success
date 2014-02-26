class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :first_name, :last_name, :email, :password,
                  :password_confirmation, :remember_me, :type,
                  :approved, :profile_attributes

  has_many dependent: :destroy
  has_one :profile
  accepts_nested_attributes_for :profile

  def name
    return "#{first_name} #{last_name}"
  end

end