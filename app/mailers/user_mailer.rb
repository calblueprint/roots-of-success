class UserMailer < ActionMailer::Base
  default from: "ros@ros.org"

  def welcome_email(user,password)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Roots of Success!',
         body: "Your password is" + password)
  end

end
