source 'https://rubygems.org'
ruby '2.3.0'

gem 'rails', '4.2.0'
gem 'metova', '>= 0.0.13', require: ['metova/smtp']

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'webmock'
  gem 'webmock-rspec-helper'
  gem 'minitest-rails-capybara'
  gem 'minitest-metadata', require: false
  gem 'mocha'
  gem 'capybara_minitest_spec'
  gem 'rspec-sidekiq'
  gem 'database_cleaner'
  gem 'test_after_commit'
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'fabrication'
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'quiet_assets'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'sqlite3'
  gem 'timecop'
  gem 'pry-byebug'
  gem 'byebug'
  gem 'webrick'
  gem 'validates_email_format_of'
end

# group :assets do
  gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'
# end

group :production do
  gem 'pg'
  # gem 'rails_12factor'
  # gem 'puma'
end
gem 'whenever'
# assets
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'rails-timeago', '~> 2.0'
gem 'paperclip'
gem 'social-share-button'

# deployment
gem 'capistrano', '~> 3.0', require: false
gem 'capistrano-rbenv', '~> 2.0'
gem 'capistrano-rails', '~> 1.1', require: false
gem 'capistrano-bundler', '~> 1.1', require: false
gem 'capistrano3-unicorn', require: false
gem 'country_select'
gem 'iso_country_codes'
gem 'elbas', '0.24.0'

gem 'minitest-rails'
gem 'avocado-docs', '~> 3.0.0'
gem 'aws-healthcheck'
gem 'aws-sdk', '~> 2.3.0'
gem 'bootstrap-sass'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.7.14'
gem 'font-awesome-rails'
gem 'connection_pool'
gem 'enumerize'
gem 'figaro'
gem 'foreman'
gem 'memoit'
gem 'paper_trail'
gem 'refile', github: 'refile/refile'
gem 'refile-mini_magick', github: 'refile/refile-mini_magick'
gem 'refile-s3'
gem 'refile-backgrounder'
gem 'responders'
gem 'rb-readline'
gem 'simple_form'
gem 'spring', group: :development
gem 'streamio-ffmpeg'
# gem 'unicorn'
gem 'square_connect', :git => 'https://github.com/square/connect-ruby-sdk.git'

gem 'yajl-ruby', require: 'yajl'
gem 'yarjuf'
gem 'validates_email_format_of'
## Authentication
gem 'devise'
gem 'devise-async'

## Carrierwave (file uploads)
# gem 'carrierwave'
# gem 'metova-carrierwave', '0.0.2'
gem 'mini_magick'

## Memcached
# gem 'dalli'
# gem 'dalli-elasticache'

## Sidekiq
gem 'sidekiq', '~> 4.2', '>= 4.2.10'
gem 'sinatra', require: nil
gem 'capistrano-sidekiq'
gem 'rspec-sidekiq', group: :test
gem 'redis-rails'

gem 'textacular', '~> 3.0'

## Pagination
# gem 'kaminari'

## JSON serialization
gem 'active_model_serializers' #, github: 'rails-api/active_model_serializers'

## Authorization
gem 'pundit'

##UI
gem 'jquery-datatables'
gem "wysiwyg-rails"


## Location
gem 'geocoder'
gem 'authorizenet'
gem 'twilio-ruby'
##Payment Integration
gem 'paypal-sdk-rest'
gem "rubycritic", require: false
gem 'bitpay-sdk', :require => 'bitpay_sdk'
gem 'shippo', git: 'https://github.com/goshippo/shippo-ruby-client'
gem 'awesome_print'
# gem 'will_paginate'

## Logging
gem 'remote_syslog_logger'