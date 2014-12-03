source 'https://rubygems.org'
ruby '2.1.5'

# Core gems
gem 'rails', '4.1.8'
gem 'thin'
gem 'pg'
gem 'figaro'
gem 'sucker_punch'

# Components
gem 'turbolinks'
gem 'cancan'
gem 'devise'
gem 'nokogiri'
gem 'jquery-datatables-rails'
gem 'jquery-ui-rails'
gem 'will_paginate'
gem 'newrelic_rpm'
gem 'simple_form'
gem 'carrierwave'
gem 'forem', :github => 'radar/forem', :branch => 'rails4'
gem 'select2-rails'

# Frontend
gem 'slim-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'compass'
gem 'zurb-foundation'
gem 'bootstrap-sass'

group :development do
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rubocop'
  gem 'guard-rubocop'
  gem 'guard-livereload'
end

group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'pry-byebug'

  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'i18n-tasks'
  gem 'ffaker'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner', '~> 1.3.0'
  gem 'capybara', '~> 2.4.4'
  gem 'launchy'
  gem 'guard-rspec'
end

group :staging, :production do
  gem 'rails_12factor'
end
