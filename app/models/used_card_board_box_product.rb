require 'csv'
require 'open-uri'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class UsedCardBoardBoxProduct < ActiveRecord::Base
  
  has_many :box_choices
  has_many :move_sizes, :through => :box_choices

  validates_uniqueness_of :product_id
  
  def self.import_data_file
    #put in ftp stuff to get file
    infile = "ucbb_products.csv"

    puts "processing file"
    trends = File.open(infile)
    started_reading_data = false
    keep_reading_data = true
    count = 0
    CSV.foreach(infile) do |row|
      prd = UsedCardBoardBoxProduct.find_by_product_id(row[0])
      if !prd
        prd = UsedCardBoardBoxProduct.create(
          :product_id => row[0],
          :name => row[1],
          :company_name => row[3],
          :link => row[4],
          :image_url => row[6],
          :price => row[7],
          :description => row[11],
          :merchant_id => row[2],
          :thumbnail_url => row[5],
          :instock_status => row[18]
          )
      else
        prd.name = row[1]
        prd.company_name = row[3]
        prd.link = row[4]
        prd.image_url = row[6]
        prd.price = row[7]
        prd.description = row[11]
        prd.merchant_id = row[2]
        prd.thumbnail_url = row[5]
        prd.instock_status = row[18]
        prd.save!
      end
      puts "INFO: created product #{prd.name}"
    end
  end

  def self.check_for_purchases
    start_date = 20.days.ago.strftime("%m/%d/%Y")
    end_date = 0.days.ago.strftime("%m/%d/%Y")
    url = "http://shareasale-homefinder.apigee.com?"
#    url = "https://shareasale.com/x.cfm?"
    url += "action=activity&affiliateId=398075&token=zTTUzIxaWkMdfNzJ"
    url += "&dateStart=#{start_date}&dateEnd=#{end_date}"
    url += "&merchantId=22817&sortCol=commission&sortDir=desc&version=1.3"
    puts url
    result = ""
    new_array = []
    begin #taking this out for now so i get notified if shit breaks
      open(url) do |f|
        result = f.read
      end
        #get a clean array of results
        results_array = result.split(/\n/)
        if results_array.size > 0
          results_array[1..(results_array.size - 1)].each do |line|
            row = line.split("|")
            if row[0] && !row[0].blank?
              new_array << row 
              puts "Trans ID: #{row[0]}"
              puts "User ID: #{row[1]}"
              puts "Merchant ID: #{row[2]}"
              puts "Trans Date: #{row[3]}" #when they bought
              puts "Trans Amount: #{row[4]}" #how much they paid
              puts "Commission: #{row[5]}"
              puts "Comment: #{row[6]}"
              puts "Voided: #{row[7]}"
              puts "Pending Date: #{row[8]}"
              puts "Locked: #{row[9]}"
              puts "Aff Comment: #{row[10]}"  #our user id will be here
              puts "Banner Page: #{row[11]}"
              puts "Reversal Date: #{row[12]}"
              puts "Click Date|: #{row[13]}" #when they clicked
              puts "Click Time: #{row[14]}"
              puts "Banner Id: #{row[15]}"
              puts "SKU List: #{row[16]}"
              puts "Quantity List: #{row[17]}"
              puts "Lock Date: #{row[18]}"
              puts "Paid Date: #{row[19]}"
            end
          end
        end
        #now that we have a clean array, roll through, and enter new purchases
        new_array.each do |trans|
          puts y trans
          purchase = Purchase.find_by_aff_transaction_id(trans[0])
          user = User.find(trans[10].to_i)
          if !purchase && user
            puts "INFO: found user id: #{user.id} #{user.email}, creating purchase"
            p = Purchase.new(:aff_transaction_id => trans[0],
              :aff_merchant_id => trans[2],
              :transaction_date => Time.parse(trans[3]),
              :transaction_amount => trans[4].to_f,
              :commission => trans[5].to_f,
              :click_datetime => Time.parse("#{trans[13][0,10]} #{trans[14]}")
              )
            p.user = user
            p.save!
          else
            puts "INFO: user not found for id: #{trans[10]}"
          end
        end
#    rescue Exception => e
#      new_array = e
#    end
    new_array
  end
  
  def self.get_cj_stuff
    cj_key = "008016fb41b7ac8b6bcbc3f78f8dcf58d48ebc9a40c6edd3180211a748a2662ea2e7ee115b35e5b577d7902e21802a059f79bbee9a272bfbe757123523d513c259/772e6afcbbdd4520b8c90f68b8074cdd022ec4cc2f0c8c94d31fffe9da897f2beacf6bbd177a46085627f32e34cb873a46782833ccc1a4db296faf087de9895d"
    website_id = "3791691"
    moveout_id = "784712"
    home_depot_id  = '1461363 '
    cj = CommissionJunction.new(cj_key, website_id)
    # See http://help.cj.com/en/web_services/product_catalog_search_service_rest.htm
     # for the list of request and response parameters.
#     cj.product_search('keywords' => '+blue +jeans',
#                       'advertiser-ids' => 'joined',
#                       'serviceable-area' => 'us',
#                       'currency' => 'usd',
#                       'records-per-page' => '5').each do |product|
     cj.product_search('keywords' => '+moving +boxes',
                        'advertiser-ids' => 'joined',
                       'serviceable-area' => 'us',
                       'currency' => 'usd',
                       'records-per-page' => '1000').each do |product|
       puts product.name
       puts product.price
       puts product.image_url
       puts ''
     end
  end

end
