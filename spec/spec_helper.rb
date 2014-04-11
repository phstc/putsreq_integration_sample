require 'capybara'
require 'capybara/poltergeist'
require 'httparty'
require 'pry-byebug'
require 'faker'

# Check .travis.yml for specific ENV configuration
WEBSITE_URL = ENV.fetch('WEBSITE_URL', 'http://localhost:9292')

Capybara.javascript_driver = :poltergeist
Capybara.app_host = WEBSITE_URL
Capybara.run_server = false # don't start Rack

Dir['./spec/support/**/*.rb'].each &method(:require)

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
  config.include Capybara::DSL, type: :feature
end
