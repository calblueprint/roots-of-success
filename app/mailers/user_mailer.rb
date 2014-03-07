class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    # @url  = link_to "Home", root_path
    mail(to: @user.email, subject: 'Welcome to Roots of Success!')
  end

end
