# You should edit this file with the browsers you wish to use
# For options, check out http://saucelabs.com/docs/platforms
require "sauce"
require "sauce/capybara"
require "capybara/rails"
require "capybara/rspec"

Capybara.run_server = false
Capybara.default_driver = :sauce

Sauce.config do |config|
  config[:start_tunnel] = false
  config[:browsers] = [
    ["Windows 8", "Internet Explorer", "10"],
    ["Windows 7", "Firefox", "20"],
    ["Windows 8.1", "Chrome", "beta"],
    ["OS X 10.9", "Firefox", "28"]
  ]
end
