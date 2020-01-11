require 'mock_redis'
require 'selenium-webdriver'
require 'capybara/rspec'

#Capybara.configure do |capybara_config|
#  capybara_config.default_driver = :selenium_chrome
#  capybara_config.default_max_wait_time = 10
#end
#
#Capybara.register_driver :selenium_chrome do |app|
#  options = Selenium::WebDriver::Chrome::Options.new
#  options.add_argument('headless')
#  options.add_argument('--disable-gpu')
#  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
#end
#
#Capybara.javascript_driver = :selenium_chrome

RSpec.configure do |config|
  config.before(:each) do
    redis_instance = MockRedis.new
    Redis.stub(:new).and_return(redis_instance)
    Redis.current = Redis.new
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
