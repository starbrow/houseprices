
task :default => [ :scrape ]

desc "Scrape zoopla URL and output values"
task :scrape do
  require 'rubygems'
  require 'bundler/setup'
  require "./lib/zoopla_scraper"
  require "./lib/daily_price"

  url = "http://www.zoopla.co.uk/property/13-alma-street/inverkeithing/ky11-1db/12079762"

  house = ZooplaScraper.new(url)
  price = DailyPrice.new
  price.estimated_value = house.estimated_value
  price.value_range_lower = house.value_range_lower
  price.value_range_upper = house.value_range_upper
  price.save

  puts "Estimated value: £#{house.estimated_value}"
  puts "Estimated value range: £#{house.value_range_lower} - £#{house.value_range_upper}"
end

namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |t, args|
    require "sequel"
    Sequel.extension :migration
    db = Sequel.connect("sqlite://db/price.sqlite")
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, "db/migrations", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(db, "db/migrations")
    end
  end
end
