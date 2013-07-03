require "nokogiri"


RSpec::Matchers.define :have_xpath do |xpath|
  match { |string| !!Nokogiri::HTML(string.to_s).at_xpath(xpath) }
end

RSpec::Matchers.define :have_tag do |tag|
  match { |string| !!Nokogiri::HTML(string.to_s).at_css(tag) }
end

class String
  def trs
    Nokogiri::HTML(self).css('tr')
  end
end

