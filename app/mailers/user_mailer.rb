class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Roots of Success!')
  end

end
