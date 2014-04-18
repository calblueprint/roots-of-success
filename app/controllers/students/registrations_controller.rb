# Only let students register
class Students::RegistrationsController < Devise::RegistrationsController
  def create
    1 / 0
    super
  end
end
