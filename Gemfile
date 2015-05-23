source "https://rubygems.org"

gem "bundler", ">= 1.7.0"
ruby "2.2.0"

# Core gems
gem "rails", "4.1.8"
gem "thin", "~> 1.6.3"
gem "pg", "~> 0.17.1"
gem "figaro", "~> 1.0.0"
gem "sucker_punch", "~> 1.3.1"
gem "activeadmin", "~> 1.0.0.pre1"

# Components
gem "awesome_print"
gem "cancancan", "~> 1.9.2"
gem "devise", "~> 3.4.1"
gem "email_validator", "~> 1.5.0"
gem "ffaker"
gem "gon", "~> 5.2.3"
gem "kaminari", "~> 0.16.1"
gem "mini_magick"
gem "pry-rails"
gem "recipient_interceptor", "~> 0.1.2"
gem "refile", require: "refile/rails"
gem "simple_form", "~> 3.1.0"
gem "turbolinks", "~> 2.5.3"

# Frontend
gem "autoprefixer-rails", "~> 4.0.2"
gem "coffee-rails", "~> 4.1.0"
gem "flutie", "~> 2.0.0"
gem "font-awesome-sass", "~> 4.3.0"
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
  gem "i18n-tasks"
  gem "letter_opener"
  gem "quiet_assets"
  gem "rubocop"
  gem "scss_lint"
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "poltergeist"
  gem "pry-byebug"
  gem "rspec-rails", "~> 3.1.0"
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
end
