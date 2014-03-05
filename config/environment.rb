# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
RootsOfSuccess::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'your_sendgrid_username',
  :password => 'your_sendgrid_password',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}