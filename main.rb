# frozen_string_literal: true

require 'debug'
require 'axe-selenium'
require 'axe/api'
require 'axe/core'
require 'selenium-webdriver'

# this requires https://github.com/dequelabs/axe-core-gems/pull/429
options = Selenium::WebDriver::Options.firefox.tap { |opts| opts.args << '-headless' }

driver = AxeSelenium.configure(:firefox, options) do |c|
  c.jslib_path = 'node_modules/axe-core/axe.min.js'
end

url = 'https://www.ruby-lang.org/en'

driver.page.navigate.to(url)

puts "Auditing #{url}..."
res = Axe::Core.new(driver.page).call Axe::API::Run.new

if res.passed?
  puts 'Audit reported no failures '
else
  puts "Audit reports: #{res.failure_message}"
end
