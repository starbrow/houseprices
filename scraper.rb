require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'open-uri'

scraper_url = 'http://www.zoopla.co.uk/property/13-alma-street/inverkeithing/ky11-1db/12079762'
css_selector = '.big.zestimate'

doc = Nokogiri::HTML(open(scraper_url))
housevalue = doc.at_css(css_selector).inner_html.gsub(/\D/, "")
puts housevalue
