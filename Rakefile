
task :default => [ :scrape ]

desc "Scrape zoopla URL and output values"
task :scrape do
  require 'rubygems'
  require 'bundler/setup'
  require "./lib/zoopla_scraper"

  url = "http://www.zoopla.co.uk/property/13-alma-street/inverkeithing/ky11-1db/12079762"

  house = ZooplaScraper.new(url)

  puts "Estimated value: £#{house.estimated_value}"
  puts "Estimated value range: £#{house.value_range_lower} - £#{house.value_range_upper}"
end
