ENV["RAILS_ENV"] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:type => :controller) do
    request.env["HTTP_REFERER"] = "/"
  end

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"
end

def returns_valid_response
  expect(response).to be_ok
end

def returns_valid_redirect
  expect(response).to be_redirect
end

