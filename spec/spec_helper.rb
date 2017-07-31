require 'rubygems'
require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'avocado/rspec'
require 'rspec/rails'
require 'pundit/rspec'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'refile/file_double'
require 'shoulda/matchers'
require 'devise'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

WebMock.disable_net_connect! allow_localhost: true
ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

AWS.stub!
Aws.config.update(stub_responses: true)
s3 = Aws::S3::Client.new
s3.stub_data(:list_buckets, buckets:[{name: ENV['AWS_S3_BUCKET_NAME']}])

RSpec.configure do |config|
  # config.order = :random
  # settings by metova using fixtures caused errors with removal of payola
  # config.use_transactional_fixtures = true
  # config.global_fixtures = :all
  # config.fixture_path = Rails.root.join('spec', 'fixtures')
  config.use_transactional_fixtures = false

  # added database cleaner to remove persisted data from previous tests
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.render_views = true

  config.expect_with(:rspec) { |c| c.syntax = [:should, :expect] }
  config.include Capybara::DSL
  config.include Devise::TestHelpers, type: :controller
  config.include ActiveJob::TestHelper
  config.before(js: true) { page.driver.block_unknown_urls }
  config.before { clear_enqueued_jobs }

  config.around(pg: true) do |example|
    example.run if ENV['USE_PG']
  end
end
