require 'nokogiri'
require 'open-uri'
class ZooplaScraper

  attr_reader :estimated_value, :value_range_lower, :value_range_upper

  def initialize(url)
    css_selector = '.big.zestimate'
    css_selector_value = '.estimate-col-2 :nth-child(4)'
    doc = Nokogiri::HTML(open(url))
    @estimated_value = extract_digits(doc.at_css(css_selector).inner_html)
    @value_range_lower, @value_range_upper = doc.css(css_selector_value).last.inner_html.split('-')
    @value_range_lower = extract_digits(@value_range_lower)
    @value_range_upper = extract_digits(@value_range_upper)
  end

  private
    def extract_digits(value)
      value.gsub(/\D/, "")
    end
end
