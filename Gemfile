source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use background job processing
gem 'sidekiq'
gem 'sidekiq_mailer'

# Use Braintree payment gateway
gem 'braintree'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use MiniMagick & Carrierwave for image uploading
gem 'mini_magick'
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0', github: 'carrierwaveuploader/carrierwave'

# Server Storage using Fog
gem 'fog', require: 'fog/aws'

# Use Clearance & Omniauth for user authentication
gem 'clearance'
gem 'omniauth'
gem 'omniauth-facebook'

# Use Daterangepicker
gem 'bootstrap-datepicker-rails'
gem 'bootstrap', '~> 4.0.0.alpha5'
gem 'momentjs-rails'
gem 'bootstrap-daterangepicker-rails'

# Use Figaro for privacy protection
gem 'figaro'

# Use 12 Factor for deploying
gem 'rails_12factor'
gem 'rails_stdout_logging', '~> 0.0.5'
gem 'unicorn'
gem 'rack-timeout'

# Use FFaker to generate seeds
gem 'ffaker'

# Use Pagination
gem 'will_paginate', '~> 3.1.0'

gem 'postgres_ext'

# Enable usage of attr_accessible
gem 'protected_attributes'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'guard-rspec', require: false
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

