source 'https://rubygems.org'
ruby '2.1.5'

# Core gems
gem 'rails', '4.1.8'
gem 'thin', '~> 1.6.3'
gem 'pg', '~> 0.17.1'
gem 'figaro', '~> 1.0.0'
gem 'sucker_punch', '~> 1.3.1'

# Components
gem 'turbolinks', '~> 2.5.2'
gem 'cancancan', '~> 1.9.2'
gem 'devise', '~> 3.4.1'
gem 'nokogiri', '~> 1.6.5'
gem 'jquery-datatables-rails', '~> 3.1.1'
gem 'jquery-ui-rails', '~> 5.0.3'
gem 'will_paginate', '~> 3.0.7'
gem 'simple_form', '~> 3.0.3'
gem 'carrierwave', '~> 0.10.0'
gem 'forem', github: 'radar/forem', branch: 'rails4'
gem 'select2-rails', '~> 3.5.9'
gem 'ffaker', '~> 1.25.0'

# Frontend
gem 'sass-rails', '~> 4.0.5'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails', '~> 3.1.2'
gem 'slim-rails', '~> 2.1.5'
gem 'uglifier', '~> 2.5.3'
gem 'bootstrap-sass', '~> 3.3.1'

gem 'newrelic_rpm'

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
  gem 'capybara', '~> 2.4.4'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'i18n-tasks'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner', '~> 1.3.0'
  gem 'launchy'
  gem 'guard-rspec'
end

group :staging, :production do
  gem 'rails_12factor'
end
