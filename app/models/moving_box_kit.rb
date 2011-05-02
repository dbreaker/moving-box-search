require 'csv'
require 'open-uri'
require 'json'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class MovingBoxKit < ActiveRecord::Base

  has_many :box_choices
  has_many :move_sizes, :through => :box_choices
  belongs_to :company

  validates_uniqueness_of :product_id


  def self.import_data_file
    #put in ftp stuff to get file
    #infile = "ucbb_products.csv"
    infile = "22817.txt"
#    infile = "27537-2.txt"
#    infile = "27537-1.txt"

    puts "processing file"
    products = File.open(infile).read
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    products = ic.iconv(products)

    results_array = products.split(/\n/)
    if results_array.size > 0
      results_array.each do |line|
        row = line.split("|")
        if row[0] && !row[0].blank?
          prd = MovingBoxKit.find_by_product_id(row[0])
          if !prd
            prd = MovingBoxKit.create(
              :product_id => row[0],
              :name => row[1],
              :link => row[4],
              :image_url => row[6],
              :price => row[7],
              :description => row[11],
              :merchant_id => row[2],
              :thumbnail_url => row[5]
              )
              puts "INFO: created product #{prd.name}"
          else
            prd.name = row[1]
            prd.link = row[4]
            prd.image_url = row[6]
            prd.price = row[7]
            prd.description = row[11]
            prd.merchant_id = row[2]
            prd.thumbnail_url = row[5]
            puts "INFO: updates product #{prd.name}"
          end
          #associate the right company
          if prd.merchant_id == "22817"
            co = Company.find_by_merchant_id("22817")
            prd.company = co
          elsif prd.merchant_id = "27537"
            if prd.image_url.downcase.include?("uboxes")
              co = Company.where("merchant_id = ? AND LOWER(url) = ?", "27537", "http://www.uboxes.com" ).first
            else
              co = Company.where("merchant_id = ? AND LOWER(url) = ?", "27537", "http://www.ecosmartboxes.com" ).first
            end
            prd.company = co
          end
          prd.save!
        end
      end
    end
  end

  def self.update_shareasale_links
    MovingBoxKit.all.each do |kit|
      kit.link = kit.link.gsub('YOURUSERID','508424')
      kit.save!
    end
  end
  
  def self.add_in_free_shipping
    cs = []
    cs << Company.find(3)
    cs << Company.find(2)
    cs.each do |c|
      c.moving_box_kits.each do |kit|
        kit.description = kit.description.gsub("</ul>", "<li><b>Free Shipping</b></li></ul>")
        kit.save!
      end
    end
  end
  
  def make_description_pretty(company_id = nil)
    line_items = self.description.split(",")
    line_items.each do |li|
      li.strip!
    end
    line_items_string = line_items.join("</li>\n<li>")
    line_items_string += "</li>\n</ul>"
    line_items_string = "<ul><li>" + line_items_string
    self.description = line_items_string
    self.save!
  end

end
