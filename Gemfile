source "https://rubygems.org"

gem "bundler", "~> 1.12.0"
ruby "2.7.4"

# Core gems
gem "rails", "4.2.11.3"
gem "thin", "~> 1.6.3"
gem "pg", "~> 0.17.1"
gem "figaro", "~> 1.0.0"
gem "sucker_punch", "~> 1.3.1"
gem "activeadmin", "~> 1.0.0.pre1"

# Components
gem "acts_as_list"
gem "awesome_print"
gem "cancancan", "~> 1.9.2"
gem "devise", "~> 3.4.1"
gem "draper"
gem "email_validator", "~> 1.5.0"
gem "ffaker"
gem "gon", "~> 5.2.3"
gem "kaminari", "~> 0.16.1"
gem "mini_magick"
gem "pry-rails"
gem "recipient_interceptor", "~> 0.1.2"
gem "refile", "~> 0.5.5", require: "refile/rails"
gem "refile-mini_magick"
gem "refile-s3"
gem "simple_form", "~> 3.1.0"
gem "turbolinks", "~> 2.5.3"
gem "redcarpet", "~> 3.3.4"

# Frontend
gem "autoprefixer-rails", "~> 4.0.2"
gem "coffee-rails", "~> 4.1.0"
gem "flutie", "~> 2.0.0"
gem "jquery-rails", "~> 3.1.2"
gem "sass-rails", "~> 5.0.3"
gem "select2-rails", "~> 3.5.9"
gem "slim-rails"
gem "title"
gem "uglifier"

gem "bourbon", "~> 4.2.3"
gem "neat", "~> 1.7.2"
gem "bitters", "~> 0.10.1"

# Error logging - requires setup with service
gem "rollbar"

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "guard-livereload"
  gem "guard-rubocop"
  gem "letter_opener"
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "i18n-tasks"
  gem "poltergeist"
  gem "pry-byebug"
  gem "rspec-rails", "~> 3.1.0"
  gem "rubocop"
  gem "scss_lint", require: false
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "guard-rspec"
  gem "launchy"
  gem "shoulda-matchers", require: false

  gem "codeclimate-test-reporter", require: nil
end

group :staging, :production do
  gem "newrelic_rpm"
  gem "rails_12factor"

  # SSL
  gem 'letsencrypt-rails-heroku', group: 'production'
end
