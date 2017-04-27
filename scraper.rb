require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'open-uri'

scraper_url = 'http://www.zoopla.co.uk/property/13-alma-street/inverkeithing/ky11-1db/12079762'
css_selector = '.big.zestimate'
css_selector_value = '.estimate-col-2 :nth-child(4)'

doc = Nokogiri::HTML(open(scraper_url))
housevalue = doc.at_css(css_selector).inner_html.gsub(/\D/, "")
puts housevalue

doc2 = Nokogiri::HTML(open(scraper_url))
min_value, max_value = doc2.css(css_selector_value).last.inner_html.split('-')
min_value.gsub!(/\D/, "")
max_value.gsub!(/\D/, "")
puts min_value
puts max_value
