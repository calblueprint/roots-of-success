# Only let students register
class Students::SessionsController < Devise::SessionsController
  def create
    super
  end
end
