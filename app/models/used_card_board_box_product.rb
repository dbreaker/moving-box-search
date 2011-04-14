require 'csv'

class UsedCardBoardBoxProduct < ActiveRecord::Base
  
  has_many :box_choices
  has_many :move_sizes, :through => :box_choices

  validates_uniqueness_of :product_id
  
  def self.find_bad_length
    infile = "22817.txt"
        trends = File.open(infile)
        started_reading_data = false
        keep_reading_data = true
        count = 0
    #    trends.each_line do |line|
    #      count += 1
    #      puts line
    #      puts "read line #{count}"
    #      line_array = line.split("|")
    #    end
      CSV.foreach(infile, { :col_sep => "|"}) do |row|
        puts "row 0 too long" if row[0].length > 250
        puts ":name" if row[1].length > 250
        puts ":company_name" if row[3].length > 250
        puts ":link" if row[4].length > 200
        puts ":image_url" if row[6].length > 200
        puts ":price" if row[7].length > 200
        puts ":description" if row[11].length > 200
        puts ":merchant_id" if row[2].length > 200
        puts ":thumbnail_url" if row[5].length > 200
        puts ":instock_status" if row[18].length > 200
      end
  end
  
  def self.import_data_file
    #put in ftp stuff to get file
        infile = "22817.txt"
#        File.open(infile, 'r') do |f1|  
#          while line = f1.gets  
#            f2.puts line.gsub(/\"/,"")
#          end  
#        end  

    puts "processing file"
    trends = File.open(infile)
    started_reading_data = false
    keep_reading_data = true
    count = 0
#    trends.each_line do |line|
#      count += 1
#      puts line
#      puts "read line #{count}"
#      line_array = line.split("|")
#    end
    CSV.foreach(infile, { :col_sep => '|'}) do |row|
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
      puts y prd
    end
  end

end
