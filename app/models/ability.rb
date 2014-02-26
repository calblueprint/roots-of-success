class Ability
  include CanCan::Ability

  def initialize(user)
  	user ||= User.new
  end
end

# https://github.com/ryanb/cancan/wiki/defining-abilities
# ^Defining abilities