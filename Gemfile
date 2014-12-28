source "https://rubygems.org"
source "https://rails-assets.org"

ruby "2.1.5"

# Core gems
gem "rails", "4.1.8"
gem "thin", "~> 1.6.3"
gem "pg", "~> 0.17.1"
gem "figaro", "~> 1.0.0"
gem "sucker_punch", "~> 1.3.1"
gem "active_model_serializers", "~> 0.9.2"
gem "yajl-ruby", "~> 1.2.1"

# Components
gem "cancancan", "~> 1.9.2"
gem "devise", "~> 3.4.1"
gem "ffaker", "~> 1.25.0"
gem "gon", "~> 5.2.3"
gem "kaminari", "~> 0.16.1"
gem "recipient_interceptor", "~> 0.1.2"
gem "simple_form", "~> 3.1.0"
gem "turbolinks", "~> 2.5.3"

# Frontend
gem "autoprefixer-rails", "~> 4.0.2"
gem "coffee-rails", "~> 4.1.0"
gem "flutie", "~> 2.0.0"
gem "jquery-rails", "~> 3.1.2"
gem "sass-rails", "~> 4.0.3"
gem "slim-rails", "~> 2.1.5"
gem "title", "~> 0.0.5"
gem "uglifier", "~> 2.6.0"

gem "react-rails", "~> 1.0.0.pre", github: "reactjs/react-rails"
gem "rails-assets-react-router", "~> 0.11.6"

gem "bourbon", "~> 3.2.3"
gem "neat", "~> 1.5.1"
gem "bitters", "~> 0.10.1"

# Error logging - requires setup with service
gem "rollbar"

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "quiet_assets"
  gem "spring"
  gem "spring-commands-rspec"
  gem "rubocop"
  gem "guard-rubocop"
  gem "guard-livereload"
  gem "i18n-tasks"
end

group :development, :test do
  gem "awesome_print"
  gem "pry-rails"
  gem "pry-byebug"

  gem "rspec-rails", "~> 3.1.0"
  gem "factory_girl_rails"
end

group :test do
  gem "shoulda-matchers", require: false
  gem "database_cleaner"
  gem "capybara"
  gem "launchy"
  gem "guard-rspec"

  gem "codeclimate-test-reporter", require: nil
end

group :staging, :production do
  gem "rails_12factor"

  # Analytics - requires setup
  gem "newrelic_rpm"
end
