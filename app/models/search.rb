require 'open-uri'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Search < ActiveRecord::Base

  belongs_to :move_size
  
  def self.find_boxes(keyword = nil)
    kw = "+#{keyword.gsub(' ','+')}" if keyword
    url = "https://www.googleapis.com/shopping/search/v1/public/products?key=AIzaSyC72VFxYl-1yzdc5V1QfQxBdVGQpFd6npg&country=US&q=moving+boxes#{kw}"
    puts url
    result = ""
    begin
      open(url) do |f|
        result = f.read
      end
      result = JSON.parser.new(result,{}).parse
      puts y result
    rescue Exception => e
      result = e
    end
    result
  end
end
