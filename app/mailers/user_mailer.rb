class UserMailer < ActionMailer::Base
  default from: "ros@ros.org"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Roots of Success!')
  end

end
