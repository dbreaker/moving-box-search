require 'open-uri'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Search < ActiveRecord::Base

  belongs_to :move_size
  belongs_to :user
  has_many :clicks
  
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


#  def self.get_movers
#    url =   "http://api.factual.com/v2/tables/s4OOB4/read?APIKey=SOiupySukLlh4Tw8NHCH6Mg7UtHHm1lVwa9foJHfkSHxEmycDSeFus5cnfpDH0Fa&filters={%22category%22:{%22$bw%22:%22Real%20Estate%20%26%20Home%20Improvement%20%3E%20Movers%22},%22$search%22:[%22movers%22]}&sort={%22factual_id%22:1}&limit=50"
#    &offset=450
    #offset max is 50
#  end
end

